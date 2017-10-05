class InvoiceSerializer < ActiveModel::Serializer
<<<<<<< HEAD
  attributes :id, :customer_name, :merchant_name, :status

  def customer_name
    object.customer.name
  end

  def merchant_name
    object.merchant.name
  end
  
=======
  attributes :id, :status, :customer_id, :merchant_id
>>>>>>> 800022b8cb85433dc22a7646a9a1319c3f1b142a
end
