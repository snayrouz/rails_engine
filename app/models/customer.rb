class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name

  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def name
    first_name + " " + last_name
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
