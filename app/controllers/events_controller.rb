class EventsController < ApplicationController

  before_action :only_logged_in
  helper_method :is_owner?

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params_event)
    @event.creator = @user
      if @event.save
        flash[:notice] = "Vous avez bien créé l'évènement !"
        redirect_to user_path
      else
        flash[:alert] = "Merci de renseigner tous les champs correctement."
        render new
      end
  end

  def show
    @event = Event.find_by_id(params[:id])
  end

  def edit
    @event = Event.find_by_id(params[:id])
      if !is_owner?(@event)
        redirect_to user_path
      end
  end

  def update
    @event = Event.find_by_id(params[:id])
    @event.update(params_event)
      if @event.save
        flash[:notice] = "Vous avez bien modifié l'évènement !"
        redirect_to event_path
      else
        flash[:alert] = "Merci de renseigner tous les champs correctement."
        render edit
      end
  end

  def destroy
    @event = Event.find_by_id(params[:id])
    @event.destroy
    flash[:notice] = "L'event a été supprimé."
    redirect_to user_path
  end

  def index
    @events = Event.all
    events_aging(@events)
  end

  def profile
    @events = @user.created_events
    events_aging(@events)
  end

  def subscribe
    @event = Event.find(params[:event])
    @event.attendees << @user
    flash[:notice] = "Tu as bien rejoint l'évènement !!"
    redirect_to event_path(@event)
  end

  def unsubscribe
    @event = Event.find(params[:event])
    @event.attendees.delete(@user)
    flash[:notice] = "Tu as bien quitté l'évènement !!"
    redirect_to event_path(@event)
  end

  private

  def params_event
    params.require(:event).permit(:title, :description, :date, :place)
  end

  def is_owner?(event)
    @user == User.find_by_id(event.creator_id)
  end

end
