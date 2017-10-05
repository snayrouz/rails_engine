class Api::V1::Items::RevenueController < ApplicationController

  def index
    quantity = params["quantity"]
    render json: Item.top_by_revenue(quantity)
  end

end
