class Api::V1::Items::SearchController < ApplicationController
  def show
    render json: ItemSerializer.new(Item.single_find(params))
  end

  def index
    render json: ItemSerializer.new(Item.multi_find(params))
  end

end
