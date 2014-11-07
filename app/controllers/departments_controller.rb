class DepartmentsController < ApplicationController

  def index
      departments = Department.all.order('created_at DESC').select('id, name, code, updated_at')

      respond_to do |format|
        format.json { render json: departments, except: :places, root: false }
      end
  end

  def show

    department = Department.find(params[:id])


      places = department.places.order('created_at DESC')

      respond_to do |format|
        format.json { render json: places, except: :department, root: false }
      end
  end

end