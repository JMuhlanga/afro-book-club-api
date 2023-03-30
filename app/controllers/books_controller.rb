class BooksController < ApplicationController
    # before_action :authorize, only: [:create, :destroy, :update]
    before_action :set_book, only: [:show, :update, :destroy]
  
    def index
        books = Book.all 
        render json: books
    end
  
    def show
        book = Book.includes(:user).find_by(id: params[:id])
        render json: book.as_json(include: { user: { only: [:username] } })
    end
  
    def create
      book = Book.create(book_params)
     
      if book.persisted?
        render json: book, status: :created, location: book
      else
        render json: book.errors, status: :unprocessable_entity
      end
    end
    
    
    
    
  
    def update
      if @book.update(book_params)
        render json: @book
      else
        render json: @book.errors, status: :unprocessable_entity
      end
    end
    
    def destroy
      @book.destroy
    end
    
  
    private

    def set_book
      @book = current_user.books.find(params[:id])
    end      
  
    def book_params
      params.require(:book).permit(:title, :img, :bookLink, :description, :user_Id).tap do |whitelisted|
        whitelisted[:user_id] = params[:user_Id]
      end
    end
    
end
  
