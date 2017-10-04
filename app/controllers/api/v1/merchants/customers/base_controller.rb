class Api::V1::Merchants::Customers::BaseController < ApplicationController

  protected

  def find_merchant
    @merchant = Merchant.find(params[:id])
  end

end
