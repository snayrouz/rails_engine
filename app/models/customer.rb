class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name

  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def name
    first_name + " " + last_name
  end

  def with_pending_invoices(merchant_id)
    joins(:invoices, :transactions)
    .where(invoices: {merchant_id: merchant_id})
    .except(transactions: {status: 'success'})
  end

  def merchant_favorite(merchant_id)
    .select("customers.*, sum(invoice_items.quantity*invoice_items.unit_price) AS revenue")
    .joins(:invoices, :transactions)
    .where(invoices: {merchant_id: merchant_id}, transactions: {status: 'success'})
    .max_by("revenue")
  end

end
