class UsersController < ApplicationController

  def show

    user = User.find(params[:id])


      respond_to do |format|
        format.json { render json: user, except: :authentication_token, root: false }
      end
  end

end