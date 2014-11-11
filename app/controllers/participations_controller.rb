class ParticipationsController < ApplicationController

  before_action :validate_token!, only: :create

  def index
    place = Place.find(params[:id])


      respond_to do |format|
        format.json { render json: place, except: :department, root: false }
      end
  end

  def create
    participation = Participation.create!(participation_params)
    respond_to do |format|
      format.json { render json: participation, root: false }
    end
  end


  private

    def participation_params
      params.require(:participation).permit(:user_id, :place_id)
    end
end