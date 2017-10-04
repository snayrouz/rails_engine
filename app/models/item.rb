class Item < ApplicationRecord
  validates_presence_of :name, :description
  has_many :invoice_items
  has_many :invoices, -> { distinct }, through: :invoice_items
  belongs_to :merchant

  before_save :set_unit_price

  def best_day
  end

  def self.most_items(quantity = nil)
  end

  private

  def set_unit_price
    self.unit_price = self.unit_price/100
  end

end
