class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all.select(:id, :name, :unit_price)
  end

  def show
    render json: Item.find(params[:id])
  end

end
