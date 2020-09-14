class StocksController < ApplicationController

  def search
    @stock = Stock.new_lookup(params[:stock])
    # byebug
    render json: @stock
  end

end
