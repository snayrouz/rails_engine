class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name

  def favorite_merchant

  end

  
end
