class Api::V1::ItemsController < ApplicationController
  def index
    render json: Merchant.find(params[:id]).items 
  end
end
