class BooksController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy, :update]
    before_action :set_book, only: [:show, :update, :destroy]
  
    def index
        books = Book.all 
        render json: books
    end
  
    def show
        book = Book.find_by(id: params[:id])
        render json: book
    end
  
    def create
      @book = current_user.books.build(book_params)
  
      if book.save
        render json: book, status: :created, location: book
      else
        render json: book.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if book.update(book_params)
        render json: book
      else
        render json: book.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
        book.destroy
    end
  
    private
      def set_book
        book = Book.find(params[:id])
      end
  
      def book_params
        params.require(:book).permit(:title, :img, :bookLink, :description, :user_id)
      end
end
  
