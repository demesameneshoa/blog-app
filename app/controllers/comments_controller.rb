class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.author = @user

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment added!'
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @user = current_user
    @post = @comment.post

    if @comment.destroy
      flash[:success] = 'Comment successfully deleted!'
      @post.update_user_posts_counter
      redirect_to user_post_path(@user, @post)
    else
      flash[:error] = 'Comment could not be deleted, please try again...'
      render :show, locals: { user: @user, post: @post }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
