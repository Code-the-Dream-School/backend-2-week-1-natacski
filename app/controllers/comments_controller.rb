class CommentsController < ApplicationController
    # No `new` action because form is provided by PostsController#show
  before_action :set_post
  
  def create
    # @post = Post.find(params[:post_id])
    # Create associated model, just like we did in the console before
    @comment = @post.comments.create(comment_params)
    # We want to show the comment in the context of the Post
    redirect_to @post
  end

  def edit
    # @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to @post # @post will be set by before_action
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @post
  end


  private
  def comment_params
    params.require(:comment).permit(:name, :content)
  end

  def set_post
     @post = Post.find(params[:post_id])
  end  
end
