class Api::V1::ItemsController < ApplicationController
<<<<<<< HEAD

  def index
    render json: Item.all.select(:id, :name, :unit_price)
  end

  def show
    render json: Item.find(params[:id])
  end

=======
  def index
    render json: Item.all
  end
  def show
    render json: Item.find(params[:id])
  end
>>>>>>> 800022b8cb85433dc22a7646a9a1319c3f1b142a
end
