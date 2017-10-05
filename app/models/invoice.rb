class Invoice < ApplicationRecord
  validates_presence_of :status
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  scope :completed, -> { joins(:transactions).merge(Transaction.successful).uniq }
  scope :pending, -> { all - Invoice.completed }

  def total_revenue_at_date(date=nil)
    select("sum(revenue), sum(invoice_items.quantity * invoice_items.unit_price)")
    .completed
    .joins(:invoice_items)
    .where(updated_at: date)
  end

end
