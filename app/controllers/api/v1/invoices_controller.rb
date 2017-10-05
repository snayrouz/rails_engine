class Api::V1::InvoicesController < ApplicationController
<<<<<<< HEAD

  def index
    render json: Invoice.all
  end

  def show
    render json: Invoice.find(params[:id])
  end

=======
  def index
    render json: Invoice.all
  end
  def show
    render json: Invoice.find(params[:id])
  end
>>>>>>> 800022b8cb85433dc22a7646a9a1319c3f1b142a
end
