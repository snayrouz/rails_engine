class PendingInvoicesController < Api::V1::Merchants::Customers::BaseController

  def index
    render json: Customer.pending_invoices(params[:merchant_id])
  end

end
