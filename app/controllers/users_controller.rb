class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def friends
    @friends = current_user.friends
  end 

  def search
    if params[:friend].present?
      @friend = User.where(params[:email, :first_name])
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter an email or a name"
      end
    end
  end
end
