class Merchant < ApplicationRecord
  validates_presence_of :name
<<<<<<< HEAD

  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
=======
>>>>>>> 184884783976d764ecdc6eaff0f1ce422a363d81
end
