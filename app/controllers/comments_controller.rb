class CommentsController < ApplicationController
    before_action :authorize, only: [:create, :destroy]
    before_action :set_comment, only: [:show, :update, :destroy]
  
    def index
      if params[:book_id]
        comments = Book.find(params[:book_id]).comments
      else
        comments = Comment.all
      end
  
      render json: comments
    end
  
    def show
        comment = Comment.find(params[:id])
        render json: comment
    end
  
    def create
      comment = current_user.comments.build(comment_params)
  
      if comment.save
        render json: comment, status: :created, location: @comment
      else
        render json: comment.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if comment.update(comment_params)
        render json: comment
      else
        render json: comment.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @comment.destroy
    end
  
    private
      def set_comment
        comment = Comment.find(params[:id])
      end
  
      def comment_params
        params.require(:comment).permit(:content, :book_id)
      end
  end
  
