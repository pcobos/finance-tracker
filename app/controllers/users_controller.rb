class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to my_portfolio_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :first_name, :last_name)
  end
end
