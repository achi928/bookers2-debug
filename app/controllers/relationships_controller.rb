class RelationshipsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    @user = User.find(params[:user_id])
    @relationship = Relationship.find_by(followed_id: @user.id, follower_id: current_user.id)
    @relationship.destroy
    redirect_to request.referer
  end

end
