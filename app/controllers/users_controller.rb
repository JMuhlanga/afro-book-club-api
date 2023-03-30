class UsersController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create, :login, :index, :show]

    # Show all
    def index
        users = User.includes(:books).select(:id, :username, :email)
        render json: users.as_json(include: { books: { only: [:id, :title, :img, :bookLink, :description] } })
    end

    # Show individual User
    def show
        user = User.includes(:books).find(params[:id])
        render json: user.as_json(include: { books: { only: [:id, :title, :img, :bookLink, :description] } }, only: [:id, :username, :email])
    end

    # Create User
    def create
        user = User.create(user_params)
        if user.save
            render json: user, status: :created
        else
            render json: {error: user.errors.full_message}, status: :unprocessable_entity
        end
    end

    # Log in
    def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: user
        else
        render json: { error: 'Invalid email or password' }, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end

end
