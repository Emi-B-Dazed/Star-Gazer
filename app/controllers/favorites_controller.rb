class FavoritesController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  def create
    @event = Event.find(params[:event_id])
    @event.favorites.create!(user: current_user)

    respond_to do |format|
      if @event.favorites
        format.html { redirect_to event_url(@event), notice: "Favorite event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Favorite event was successfully destroyed." }
      format.json { head :no_content }
    end

  end

  private
    def set_event
      @event = Event.find(params[:event_id])
    end
end
