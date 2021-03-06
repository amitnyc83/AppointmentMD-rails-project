class LocationsController < ApplicationController
before_action :login_required
before_action :find_location, except: [:index, :new, :create]


  def new
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
  end

  def index
    if @current_patient
    @locations = Location.all
  elsif @current_physician
    @location = Location.where("physician_id = ?", @current_physician.id)
  else
    flash[:notice] = "You have to be logged in to view this page"
    redirect_to root_path
  end


    def edit
      @location =Location.find(params[:id])
    end


  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:notice] = "A new location was created"
      redirect_to @location
    else
      flash[:notice] = "Sorry, you were not able to create a new location"
      render 'location/new'
    end
  end


  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to @location
    else
      render :edit
    end
  end



  private

  def location_params
    params.require(:location).permit(:name, :street, :city, :state, :zipcode, :hours_of_operation, :physician_id)
  end

  def find_patient
    @patient = Patient.find_by(id: params[:id])
  end



  def find_location
    @location = Location.find_by(id: params[:id])
  end


  def find_physician
    @physician = Physician.find_by(id: params[:id])
  end
end
