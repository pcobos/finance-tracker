class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.create(user_id: current_user.id, friend_id: params[:friend])
    # @friendship.user = current_user
    # @friendship.friend = User.find(params[:friend])
    
    # friend = User.find(params[:friend])
    # current_user.friendships.build(friend_id: friend.id)
    # byebug
    redirect_to friends_path
  end
  

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy

    redirect_to friends_path
  end
end
