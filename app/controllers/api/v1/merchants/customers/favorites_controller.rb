class FavoritesController < Api::V1::Merchants::Customers::BaseController

  def show
    render json: Customer.merchant_favorite(params[:merchant_id])
  end

end
