class FriendshipsController < ApplicationController
  def destroy
    friendship = Friendship.find(params[:id])
    friendship.user = current_user
    friendship.friend = User.find(params[:id])
    friendship.destroy

    redirect_to friends_path
  end
  
end
