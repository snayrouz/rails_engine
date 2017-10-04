class Api::V1::Merchants::Customers::FavoritesController < ApplicationController

  def show
    render json: Customer.merchant_favorite(params[:merchant_id])
  end

end
