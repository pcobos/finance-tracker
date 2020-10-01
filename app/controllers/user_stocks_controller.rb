class UserStocksController < ApplicationController
  
  def create
    stock = Stock.check_db(params[:ticker])
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user,  stock: stock)
    flash[:notice] = "Stock #{stock.name} was succesfully added to your portfolio"
    redirect_to my_portfolio_path
  end

  def destroy
    @user_stock = UserStock.find(params[:id])
    @user_stock.destroy

    redirect_to my_portfolio_path
  end

end

# else
#   flash[:alert] = "Stock was not added, please try again"
#   render "my_portfolio"