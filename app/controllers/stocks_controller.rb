class StocksController < ApplicationController

  def search
    @stock = Stock.new_lookup(params[:stock])
    # byebug
    render 'users/my_portfolio'
  end

end
