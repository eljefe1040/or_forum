class CommentsController < ApplicationController
  
  before_action :find_post
  before_action :find_comment, only: [:edit,:update,:destroy]
  
  def show
  end

  def new
    @comment = Comment.new
    @comment.post_id = @post.id
    @comment.user_id = current_user.id
  end
  
  
  def create 
    @comment = Comment.new(comment_params)
    if @commnent.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end
  
  def edit
  end 
  
  def update
    If @comment.update(comment_params)
    redirect_to post_path(@post)
  else
    render 'edit'
  end
  
  def destroy
    @comment.destroy
    redirect_to root_path
  end
  
  private
  
  def comment_params
    params.require(:comment).perimit(:body)
  end
  
  def find_post
    @post = Post.find(params[:post_id])
  end
  
  def find_comment
    @comment = Comment.find(params[:book_id])
  end
end
