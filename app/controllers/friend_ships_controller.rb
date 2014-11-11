class FriendShipsController < ApplicationController

  before_action :validate_token!

  def create

    friendship = FriendShip.create(friendship_params)
    respond_to do |format|
      format.json { render json: friendship, only: :id, root: false }
    end

  end

  def update

    friendship = FriendShip.find(params[:id])

    state = friendship_params[:state] ? :active! : :refused! 

    friendship.send(state)

    respond_to do |format|
      format.json { render json: friendship.receiver, except: [:authentication_token, :slug, :username, :email], root: false }
    end

  end

  private

    def friendship_params
      params.require(:friendship).permit(:sender_id, :receiver_id, :state)
    end
end