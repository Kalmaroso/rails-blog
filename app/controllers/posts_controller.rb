class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    params[:posts][:user_id] = current_user_id
    params[:posts].permit!
    @post = Post.new(params[:posts])
    if @post.save
      redirect_to root_path
    else
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @author = @post.user
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @id = params[:id]
    params[:posts].permit!
    Post.update(@id, params[:posts])
    redirect_to "/posts/#{@id}"
  end
end
