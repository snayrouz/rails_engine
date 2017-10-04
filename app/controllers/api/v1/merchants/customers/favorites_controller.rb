class FavoritesController < Api::V1::Merchants::Customers::BaseController
  before_action :find_merchant

  def show
    render json: @merchant.favorite_customer
  end

end
