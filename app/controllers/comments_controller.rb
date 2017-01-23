class CommentsController < ApplicationController

  def create
    @post_id = params[:comments][:post_id]
    params[:comments][:user_id] = current_user_id
    params[:comments].permit!
    comment = Comment.new(params[:comments])
    if comment.save
      redirect_to "/posts/#{@post_id}"
    else
      redirect_to "/posts/#{@post_id}/comments/new"
    end
  end

  def destroy
    @c_id = params[:id]
    @p_id = Comment.find(@c_id).post.id
    Comment.destroy(@c_id)
    redirect_to "/posts/#{@p_id}"
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @c_id = params[:id]
    params[:comments].permit!
    @p_id = Comment.find(@c_id).post.id
    Comment.update(@c_id, params[:comments])
    redirect_to "/posts/#{@p_id}"
  end
end
