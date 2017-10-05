class Api::V1::InvoiceItemsController < ApplicationController

  def index
    render json: InvoiceItem.all
  end

  def show
    render json: InvoiceItem.find(params[:id])
  end
<<<<<<< HEAD

=======
>>>>>>> 800022b8cb85433dc22a7646a9a1319c3f1b142a
end
