class SessionsController < ApplicationController
    before_action :user_authenticated, only: [:new]

    def user_authenticated
    if logged_in?
        return redirect_to tweets_path
    end
    end
    def new; end

    def create
    user = User.find_by(username: params[:session][:username])
    if user
        login(user)
        flash[:success] = 'You have successfully logged in'
        redirect_to tweets_path
    else
        flash.now[:danger] = 'There is something wrong with your login information'
        render 'new'
    end
    end

    def destroy
    log_out
    flash[:success] = 'You have logged out'
    redirect_to root_path
    end
end
