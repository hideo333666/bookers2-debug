class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create 
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to request.referer
  end
  
  def destroy
    @user = Relationship.find(params[:user_id])
    current_user.unfollow(@user)
    redirect_to request.referer
  end
  
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
  
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  
  def search 
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
  end
  
  if @model == "user"
    @records = User.search_for(@content, @method)
  else
    @records = Books.search_for(@content, @method)
  end
  
end
