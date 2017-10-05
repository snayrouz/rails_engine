class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.top_by_revenue(number)
    select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(invoices: :transactions)
    .order("revenue DESC")
    .merge(Transaction.successful)
    .limit(number)
  end

end
