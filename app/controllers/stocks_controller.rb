class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      # byebug
      if @stock
        # The following method accepts a block and expects a js.erb partial
        respond_to do |format|
          format.js { render partial: 'users/stocks' }
        end
      else
        flash[:alert] =  "Please enter a valid Symbol"
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] =  "Please enter a symbol"
      redirect_to my_portfolio_path
    end
  end
end
