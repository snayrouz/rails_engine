class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name

  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def name
    first_name + " " + last_name
  end

  def self.with_pending_invoices(merchant_id)
    joins(:transactions)
    .where(invoices: {merchant_id: merchant_id})
    .merge(Invoice.pending)
  end

  def self.merchant_favorite(merchant_id)
    select("customers.*, sum(invoice_items.quantity*invoice_items.unit_price) AS revenue")
    .joins(:transactions)
    .merge(Invoice.completed)
    .where(invoices: {merchant_id: merchant_id})
    .maximum("revenue")
  end

  def favorite_merchant
    invoices
    .select('merchants.*, count(invoices.id) AS customer_transactions')
    .joins(:transactions, :merchant)
    .merge(Transaction.successful)
    .group('merchants.id')
    .order('customer_transactions DESC')
    .first
  end
end
