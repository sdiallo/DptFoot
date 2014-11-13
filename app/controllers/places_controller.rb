class PlacesController < ApplicationController

  def show
    place = Place.find(params[:id])

      respond_to do |format|
        format.json { render json: place, root: false }
      end
  end

end