class RegistrationsController < Devise::RegistrationsController
  
  respond_to :json
  
  def create
    user = User.new(user_params)
    if user.save
      sign_in('user', user)
      return render json: user, root: false, status: 201
    else
      warden.custom_failure!
      render json: user.errors, status: 422
    end
  end


  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end