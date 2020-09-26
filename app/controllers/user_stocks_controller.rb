class UserStocksController < ApplicationController
  def create
    sotck = Stock.check_db(params[:ticker])
    stock = Stock.new_lookup(params[:ticker])
    @user_stock = UserStock.create(user: current_user, stock: stock)
  end
end
