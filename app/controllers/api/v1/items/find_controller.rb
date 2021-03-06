class Api::V1::Items::FindController < ApplicationController

  def index
    render json: Item.where(search_params)
  end

  def show
    render json: Item.find_by(search_params)
  end

  private

  def search_params
    params.permit(:name,
                  :description,
                  :unit_price,
                  :created_at,
                  :updated_at,
                  :merchant_id)
  end
end
