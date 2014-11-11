class DepartmentsController < ApplicationController

  def index
      departments = Department.all.order('created_at ASC').select('id, name, code, updated_at')

      respond_to do |format|
        format.json { render json: departments, except: :places, root: false }
      end
  end

  def show

    department = Department.find(params[:id])

    if stale? department

      places = department.places.order('created_at DESC')

      respond_to do |format|
        format.json { render json: places, root: false }
      end
    end
  end

end