class UsersController < ApplicationController
  # Get a list of ids of the people the user follows on twitter
  def get_following_hashes
    user = User.find(params[:user_id])
    following_hashes = user.get_following_hashes
    respond_to do |format|
      format.json {render json: following_hashes}
    end
  end
  
  # Get a list of twitter usernames from a list of twitter ids
  def get_screen_names
    ids = params[:ids].map {|id| id.to_i}
    screen_names = User.get_twitter_screen_names ids
    respond_to do |format|
      format.json {render json: screen_names}
    end
  end
end