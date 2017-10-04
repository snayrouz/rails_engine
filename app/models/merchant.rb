class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices

  def total_revenue
    invoices.
  end

  def total_revenue_by_date(date)
    invoices.
  end


end
