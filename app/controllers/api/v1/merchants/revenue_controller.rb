<<<<<<< HEAD
class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    quantity = params["quantity"]
    render json: Merchant.top_by_revenue(quantity)
  end

  def show
    date = params["date"]
    render json: Invoice.total_revenue_at_date(date)
=======
class Api::V1::RevenueController < ApplicationController

  def show
    render json: Merchant.find(params[:id])
    if params[:date]
      render json: { "revenue" => merchant.total_revenue_by_date(params[:date]) }
    else
      render json: { "revenue" => merchant.total_revenue }
    end
>>>>>>> 800022b8cb85433dc22a7646a9a1319c3f1b142a
  end

end
