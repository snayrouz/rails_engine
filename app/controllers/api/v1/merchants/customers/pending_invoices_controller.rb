class PendingInvoicesController < Api::V1::Merchants::Customers::BaseController
  before_action :find_merchant

  def index
    render json: @merchant.customers_with_pending_invoices
  end

end
