class Api::V1::FavoriteMerchantController < ApplicationController
  def show
    render json: Customer.find(params[:id]).favorite_merchant, serializer: FavoriteMerchantSerializer
  end
end
