class Api::V1::Merchants::BusinessIntelController < ApplicationController
  def most_items
    render json: MerchantListSerializer.new(Merchant.most_items_sold(params))
  end

  def most_revenue
    render json: MerchantListSerializer.new(Merchant.most_revenue(params))
  end

  def revenue_with_time_range
    render json: RevenueSerializer.revenue(Merchant.revenue_with_time_range(params))
  end

  def merchant_revenue
    render json: RevenueSerializer.revenue(Merchant.merchant_revenue(params))
  end
end
