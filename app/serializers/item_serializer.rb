class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :merchant_id, :name, :unit_price_str

  def unit_price_str
    object.unit_price.to_s
  end
end
