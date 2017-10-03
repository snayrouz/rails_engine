class Api::V1::InvoicesController < ApplicationController

  def index
    render json: Invoice.all
  end

  def show
    render json: Invoice.find(params[:id])
  end

  def find
    render json: get_query_results[0]
  end

  def find_all
    render json: get_query_results
  end

  private

  def get_query_results
    results = []
    params.each_pair do |param_name, param_value|
      if Invoice.has_attribute?(param_name)
        results << Invoice.where(param_name.to_sym => param_value).to_a
      end
    end
    results.flatten
  end

end
