class SessionsController < ActionController::Base
  before_action :authorize, except: [:create]
  
   
    # Log in
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          cookies.signed[:user_id] = user.id
          puts "User session created with user_id #{user.id}"
          render json: { user_id: user.id, name: user.username}
        else
          render json: { error: 'Invalid email or password' }, status: :unprocessable_entity
        end
    end
  
  
    # Log out
    def destroy
      cookies.delete(:user_id)
      render json: { message: 'Successfully logged out.' }
    end
end
  
