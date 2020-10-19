class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def friends
    @friends = current_user.friends
  end 

  def search
    if params[:friend].present?
      @friend = User.where(params[:friend])
    end
  end
end
