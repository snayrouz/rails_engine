class Api::V1::Merchants::Customers::PendingInvoicesController < ApplicationController

  def index
    render json: Customer.with_pending_invoices(params[:merchant_id])
  end

end
