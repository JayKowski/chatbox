# frozen_string_literal: true

class FollowsController < ApplicationController
  def new
    @follow = Follow.new
  end

  def create
    @follow = Follow.new(follower_id: params[:follower_id], followee_id: params[:followee_id])
    if @follow.save
      flash[:notice] = 'Added friend.'
      redirect_to user_path(params[:followee_id])
    else
      flash[:notice] = 'Unable to add friend.'
    end
  end

  def destroy
    @follow = Follow.where(follower_id: params[:follower_id], followee_id: params[:followee_id]).first
    @follow.delete
    redirect_to user_path(params[:followee_id])
  end
end
