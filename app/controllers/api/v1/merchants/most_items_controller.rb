class Api::V1::MostItemsContoller < ApplicationController
  def index
    render json: Merchant.most_items(params[:quantity])
  end
end
