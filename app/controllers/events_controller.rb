class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:new, :create]
  before_action :require_is_owner, only: [:new, :create]

  def new
    @event = Event.new
  end
  def create
    @event = Event.new(event_params)
    @event.group = @group
    @event.user = current_user
    if @event.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

private
  def event_params
    params.require(:event).permit(:topic, :time, :location, :description)
  end
  def set_group
    @group = Group.find(params[:group_id])
  end
  def require_is_owner
    if !current_user.is_owner_of?(@group)
      flash[:alert] = 'You are not the event owner!'
      redirect_to root_path
    end
  end
end
