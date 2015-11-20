class CommentsController < ApplicationController
  
  before_action :find_comment, only: [:show, :edit, :update, :destroy]
  
  def show
  end
  
  def new
    @comment = Comment.new
  end
  
  def create 
    @comment = Comment.new(comment_params)
    if @commnent.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
  end 
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def comment_params
    params.require(:comment).perimit(:body)
  end
  
  def find_comment
    @comment = Comment.find(params[:id])
  
end
