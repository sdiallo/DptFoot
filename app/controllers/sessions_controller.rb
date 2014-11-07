class SessionsController < Devise::SessionsController

  prepend_before_filter :require_no_authentication, only: [:new, :create]
  
  before_filter :ensure_params_exist
 
  respond_to :json

  
  def create
    resource = User.find_for_database_authentication(login: params[:user][:login])

    return invalid_login_attempt unless resource
    if resource.valid_password?(params[:user][:password])
      sign_in('user', resource)
      render json: resource, except: [:friends, :friendships], success: true, root: false
      return
    end

    invalid_login_attempt
  end
  
  def destroy
    if sign_out(resource_name)
      render json: true, success: true
    else
      render json: false, success: false
    end
  end
 
  protected

    def ensure_params_exist
      return unless params[:user].blank?
      render json: 'missing user_login parameter', success: false, status: 422
    end
   
    def invalid_login_attempt
      warden.custom_failure!
      render json: 'Error with your login or password', success: false, status: 422
    end
end