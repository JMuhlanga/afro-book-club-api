class ApplicationController < ActionController::API
  
  skip_before_action :verify_authenticity_token

  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  

  private

  def current_user
    User.find_by(id: session[:user_id])
  end

  def authorize
    unless current_user
      render json: { errors: ["Not authorized"] }, status: :unauthorized
    end
  end

  def user_signed_in?
    current_user.present?
  end
end



  
  
