class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices

  def self.top_by_revenue(number=0)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS invoices.revenue,
    sum(invoices.revenue) AS revenue")
    .joins(invoices: :invoice_items)
    .merge(Invoice.completed)
    .order_by("revenue DESC")
    .limit(number)
  end

end
