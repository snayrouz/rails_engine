class Api::V1::InvoicesController < ApplicationController
  def index
    render json: Merchant.find(params[:id]).invoices
  end
end
