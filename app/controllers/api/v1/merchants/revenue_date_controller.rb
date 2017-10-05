class Api::V1::Merchants::RevenueDateController < ApplicationController

  def show
    render json: Invoice.total_revenue_at_date(params[:date])
  end

end
