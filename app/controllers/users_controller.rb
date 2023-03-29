class UsersController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create, :login]
    
    # Show all
    def index
        render json: User.all
    end

    # Show individual User
    def show
        user = User.find_by()
        render json: @current_user
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
