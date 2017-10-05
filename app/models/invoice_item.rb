class InvoiceItem < ApplicationRecord
  validates_presence_of :quantity, :unit_price
  belongs_to :item
  belongs_to :invoice

  # before_save :set_unit_price
  #
  # private
  #
  # def set_unit_price
  #   self.unit_price = self.unit_price/100
  # end

end
