class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, -> { distinct }, through: :invoices
  has_many :invoice_items, through: :invoices
  validates_presence_of :name

  def self.top_by_revenue(number=0)
    select("merchants.*", "sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(invoices: [:invoice_items])
    .group("merchants.id")
    .order("revenue DESC")
    .group("transactions.id")
    .merge(Invoice.unscoped.completed)
    .limit(number)
  end

  def self.most_items(quantity = nil)
    select('merchants.*, sum(invoice_items.quantity) AS item_count')
   .joins(invoices: [:invoice_items, :transactions])
   .merge(Transaction.unscoped.successful)
   .group(:id)
   .order('item_count DESC')
   .limit(quantity)
  end

  def customers_with_pending_invoices
    ids = invoices
    .joins(:customer)
    .merge(Invoice.unscoped.pending)
    .pluck(:customer_id)
    Customer.find(ids)
  end

  def favorite_customer
    invoices
    .joins(:customer, :transactions)
    .group("transactions.id", "invoices.id")
    .merge(Invoice.unscoped.completed)
    .order("count(invoices.*) DESC")
    .first
  end

  def total_revenue
    invoices
    .joins(:transactions, :invoice_items)
    .merge(Transaction.successful)
    .sum('invoice_items.unit_price * invoice_items.quantity')
    .to_f / 100
  end

  def total_revenue_by_date(date)
    invoices
    .joins(:transactions, :invoice_items)
    .merge(Transaction.successful)
    .where(invoices: {created_at: date})
    .sum('invoice_items.unit_price * invoice_items.quantity')
    .to_f / 100
  end

end
