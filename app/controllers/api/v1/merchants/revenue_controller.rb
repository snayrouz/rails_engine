class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    quantity = params["quantity"]
    render json: Merchant.top_by_revenue(quantity)
  end

  def show
    date = params["date"]
    render json: Merchant.total_revenue_at_date(date)
  end

end
