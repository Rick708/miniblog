class BlogsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @tweets = Tweet.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @tweets = Tweet.new
 end

  def create
    Tweet.create(text: tweet_params[:text], user_id: current_user.id)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
  end

  def edit
    @tweets = Tweet.find(params[:id])
  end

  def update
    @tweets = Tweet.find(params[:id])
    if @tweet.user_id == current_user.id
      @tweets.update(tweet_params)
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end


end
