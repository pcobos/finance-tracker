class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.new
    @friendship.user = current_user
    @friendship.friend = User.find(params[:friend])
    
    redirect_to friends_path
  end
  

  def destroy
    friendship = Friendship.where(user_id: current_user.id, friend_id: User.find(params[:id])).first
    friendship.user = current_user
    friendship.destroy

    redirect_to friends_path
  end
end
