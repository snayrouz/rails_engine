class Api::V1::MostRevenueController < ApplicationController
  def index
    binding.pry
    render json: Merchant.top_by_revenue(params[:quantity])
  end
end
