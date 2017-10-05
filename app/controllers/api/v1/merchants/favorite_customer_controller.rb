class Api::V1::FavoriteCustomerController < ApplicationController
  def index
    render json: Merchant.find(params[:id]).favorite_customer
  end
end
