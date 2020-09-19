class UserStocksController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
    raise
  end
end
