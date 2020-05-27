class TweetsController < ApplicationController
  def index
    @tweets = tweets_timeline.includes([:author])
    @follow = current_user.to_follow
    @reply = Reply.new
  end

  def show
    @tweet = Tweet.find(params[:id])
    @replies = @tweet.replies
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.author = current_user

    if @tweet.save
      flash[:success] = 'Tweet successfully created'
      redirect_to tweets_path
    else
      flash[:danger] = 'something went wrong'
      redirect_to user_path(current_user)
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet_body)
  end

  def tweets_timeline
    @tweets_timeline ||= Tweet.all.ordered_by_most_recent
  end
end
