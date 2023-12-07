# posts_controller.rb
require 'kaminari'

class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    # Catch all the posts associates to this user and paginate them
    @posts = Post.where(author: @user).page(params[:page]).per(3)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
  end
end
