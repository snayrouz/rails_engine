class Invoice < ApplicationRecord
  validates_presence_of :status
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions

  scope :completed, -> { Transaction.successful.joins(:invoices) }
  scope :pending, -> { merge(Transaction.successful) }
end
