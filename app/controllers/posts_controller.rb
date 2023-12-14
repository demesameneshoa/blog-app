# posts_controller.rb
require 'kaminari'

class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    # Catch all the posts associates to this user and paginate them
    @posts = Post.includes(:likes, :comments).where(author: @user).page(params[:page]).per(3)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @post = @current_user.posts.new(post_params)
    @user = User.find(params[:user_id])

    if @post.save
      redirect_to user_post_url(@user, @post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @user = current_user

    if @post.destroy
      flash[:success] = 'Post successfully deleted!'
      @post.update_user_posts_counter
      redirect_to root_path # ! we could also redirect to the user's posts_path.
    else
      flash[:error] = 'Post could not be deleted, please try again...'
      render :show, locals: { user: @user, post: @post }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
