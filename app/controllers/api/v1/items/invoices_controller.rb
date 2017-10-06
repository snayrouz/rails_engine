class Api::V1::Items::InvoicesController < ApplicationController

  def index
    render json: Item.find(params[:id]).invoices 
  end

end
