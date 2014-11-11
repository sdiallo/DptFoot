class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  respond_to :html, :json

  def validate_token!
    return false if request.headers['clientToken'].nil? or request.headers['clientId'].nil?

    token = User.find(request.headers['clientId'].to_i).authentication_token
    if request.headers['clientToken'] != token
      render json: 'Invalid Token', success: false, status: 401
    end
  end

end
