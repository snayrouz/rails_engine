class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :customer_name, :merchant_name, :status

  def customer_name
    object.customer.name
  end

  def merchant_name
    object.merchant.name
  end

end
