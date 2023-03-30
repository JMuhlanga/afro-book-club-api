class ApplicationController < ActionController::API
    before_action :authenticate_user!
  
    private
  
    def authenticate_user!
      unless user_signed_in?
        render json: { error: 'You need to sign in or sign up before continuing.' }, status: :unauthorized
      end
    end
  
    def user_signed_in?
      current_user.present?
    end
  
    def current_user
      current_user ||= User.find_by(id: session[:user_id])
    end
end
  
