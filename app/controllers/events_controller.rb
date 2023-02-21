class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:create, :update, :destroy, :new]
  before_action :set_user
  before_action :require_permission, only: [:edit, :update, :destroy]


  def index
    @search = Event.ransack(params[:q])
    @events = @search.result(distinct: true)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = @user.events.new
  end
  
  def create
    @event = @user.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end


  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :description, :happens_at, :tag, :optimal_location, :public_bool)
    end

    def set_user
      @user = current_user
    end

    def require_permission
      if Event.find(params[:id]).user_id != current_user.id
          respond_to do |format|
            format.html { redirect_to event_path(@event), notice: "You do not have permission to edit that location" }
            format.json { head :no_content }
          end
      end
    end


end
