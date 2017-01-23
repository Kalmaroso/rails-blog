class VotesController < ApplicationController
  def create
    params[:votes][:user_id] = current_user_id
    params[:votes].permit!
    @vote = Vote.create(params[:votes])
    if @vote.votable_type == "Post"
      redirect_to "/posts/#{@vote.votable_id}"
    else
      @post_id = Comment.find(@vote.votable_id).post_id
      redirect_to "posts/#{@post_id}"
    end
  end


  def update
    params[:votes].permit!
    @vote = Vote.find(params[:id])
    Vote.update(@vote.id,params[:votes])
    if @vote.votable_type == "Post"
      redirect_to "/posts/#{@vote.votable_id}"
    else
      @post_id = Comment.find(@vote.votable_id).post_id
      redirect_to "posts/#{@post_id}"
    end
  end
end
