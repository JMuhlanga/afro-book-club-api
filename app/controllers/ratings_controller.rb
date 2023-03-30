class RatingsController < ApplicationController
    before_action :authenticate_user
  
    # GET /books/:book_id/ratings
    def index
      book = Book.find(params[:book_id])
      render json: book.ratings
    end
  
    # POST /books/:book_id/ratings
    def create
      book = Book.find(params[:book_id])
      rating = book.ratings.build(rating_params.merge(user: current_user))
  
      if rating.save
        render json: rating, status: :created
      else
        render json: { error: rating.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def rating_params
      params.require(:rating).permit(:score)
    end
end
  
