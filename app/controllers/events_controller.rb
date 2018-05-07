class EventsController < ApplicationController

  before_action :only_logged_in

  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = Event.new(params_event)
    @event.creator = @user
      if @event.save
        flash[:notice] = "Vous avez bien créé l'évènement !"
        redirect_to user_path
      else
        render new
      end
  end

  def edit
  end

  def index
    @events = Event.all
  end

  def profile
    @user = current_user
  end

  private

  def params_event
    params.require(:event).permit(:title, :description, :date, :place)
  end

end
