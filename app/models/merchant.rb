class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices

  def self.most_items(quantity = nil)
    
  end

  def favorite_customer
  end

  def self.most_revenue(limit = 5)
  end

  def total_revenue
    invoices
    .joins(:transactions, :invoice_items)
    .merge(Transaction.successful)
    .sum('invoice_items.unit_price * invoice_items.quantity')
  end

  def total_revenue_by_date(date)
    invoices
    .joins(:transactions, :invoice_items)
    .merge(Transaction.successful)
    .where(invoices: {created_at: date})
    .sum('invoice_items.unit_price * invoice_items.quantity')
  end

end
