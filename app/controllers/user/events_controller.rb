class User::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to user_event_path(@event)
    else
      render 'new'
    end
  end

  def index
    @events = Event.where(user_id: current_user.id)
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to user_event_path(@event)
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to user_my_calendar_path
  end

  def my_calendar
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:user_id, :title, :body, :start_date, :end_date)
    end
end
