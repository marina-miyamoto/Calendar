class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @q = current_user.events.ransack(params[:q])
    @events = @q.result(distinct: true)
   
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def update
    @event.update!(event_params)
    redirect_to root_url, notice: "Event '#{@event.name}' has been updated."
  end

  def create
    @event = Event.new(event_params.merge(user_id: current_user.id))
    
    if @event.save
      redirect_to root_url, notice: "Event '#{@event.name}' has been added."
    else
      render :new
    end
  end

  def destroy
    @event.destroy
    redirect_to root_url, notice: "Event '#{@event.name}' has been deleted."
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :color, :start_date, :end_date)
  end

  def set_event
    @event = current_user.events.find(params[:id])
  end

end
