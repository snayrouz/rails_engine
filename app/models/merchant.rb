class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices

  def customers_with_pending_invoices
    invoices.joins(:customers).where(status: "pending").select(:customers)
  end

  def favorite_customer
    invoices.joins(:customers).select("customer_id, count(invoices) as invoice_count").max_by(:invoice_count)
  end
end
