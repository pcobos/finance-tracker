class StocksController < ApplicationController

  def search
    stock_price = Stock.new_lookup(params[:stock])
    # byebug
    render json: stock_price
  end

end
