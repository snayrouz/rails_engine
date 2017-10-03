class Api::V1::InvoicesController < ApplicationController

  def index
    render json: Invoice.all
  end

  def show
    render json: Invoice.find(params[:id])
  end

  def find
    render json: Invoice.find_by(search_params)
  end

  def find_all
    render json: Invoice.find_all(search_params)
  end

  private

  def search_params
    params.permit(:id, :status, :customer, :merchant)
  end

end
