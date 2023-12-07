class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user: @user)

    if @like.save
      redirect_to user_post_path(@user, @post), notice: 'Liked!'
    else
      redirect_to user_post_path(@user, @post), alert: 'Unable to like.'
    end
  end
end
