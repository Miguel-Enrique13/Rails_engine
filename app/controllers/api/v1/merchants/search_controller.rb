class Api::V1::Merchants::SearchController < ApplicationController
  def show
    render json: MerchantSerializer.new(Merchant.single_find(params))
  end

  def index
    render json: MerchantSerializer.new(Merchant.multi_find(params))
  end
end
