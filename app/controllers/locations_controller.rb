class LocationsController < ApplicationController
    before_action :set_location, only: %i[ show edit update destroy ]
    before_action :authenticate_user!, only: [:create, :update, :destroy, :new]
    before_action :set_user
    before_action :require_permission, only: [:edit, :update, :destroy]
    
    def index
      @locations = Location.all
    end

    def new
        @location = @user.locations.new
    end

    def create
        @location = @user.locations.new(location_params)
    
        respond_to do |format|
          if @location.save
            format.html { redirect_to location_url(@location), notice: "Location was successfully created." }
            format.json { render :show, status: :created, location: @location }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @location.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def show
      @location = Location.find(params[:id])
    end

    def update
      respond_to do |format|
        if @location.update(location_params)
          format.html { redirect_to location_url(@location), notice: "Location was successfully updated." }
          format.json { render :show, status: :ok, location: @location }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @location.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @location.destroy
  
      respond_to do |format|
        format.html { redirect_to events_url, notice: "Location was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def location_params
      params.require(:location).permit(:name, :latitude, :longitude, :pollution)
    end

    def set_user
      @user = current_user
    end

    def require_permission
      if Location.find(params[:id]).user_id != current_user.id
          respond_to do |format|
            format.html { redirect_to events_url, notice: "You do not have permission to edit that event" }
            format.json { head :no_content }
          end
      end
    end
end
