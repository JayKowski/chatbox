class RepliesController < ApplicationController
     def new
        @reply = Reply.new
    end
    
    def create
        @reply = Reply.new(reply_params)
        @reply.tweet_id = params[:tweet_id]
        @reply.user = current_user
        @tweet = params[:tweet_id]
        if @reply.save
            redirect_to tweet_path(@tweet)
        else
            redirect_to tweet_path(@tweet)
        end
    end

    private

    def reply_params
        params.require(:reply).permit(:reply_body)
    end
end
