class SessionsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create]

  # Log in
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user
        else
            render json: { error: 'Invalid email or password' }, status: :unprocessable_entity
        end
    end

    # Log out
    def destroy
        session[:user_id] = nil
        render json: { message: 'Successfully logged out.' }
    end
end
