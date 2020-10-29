class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def friends
    @friends = current_user.friends
  end 

  def search
    # @friend = User.where(email: params[:friend]).first
    # byebug
    # render json: @friend
    if params[:friend].present?
      @friend = User.where(email: params[:friend]).first
      if @friend
        respond_to do |format|
          format.js { render partial: 'users/friends' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid email"
          format.js { render partial: 'users/friends'}
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter an email"
        format.js { render partial: 'users/friends' }
      end
    end
  end
end
