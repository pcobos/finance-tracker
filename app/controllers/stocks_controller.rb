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
        respond_to do |format|
          flash[:alert] =  "Please enter a valid Symbol"
          format.js { render partial: 'users/stocks' }
        end
      end
    else
      respond_to do |format|
        flash[:alert] =  "Please enter a Symbol"
        format.js { render partial: 'users/stocks' }
      end
    end
  end
end
