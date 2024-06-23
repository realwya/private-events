class EventAttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def create
    @event_attendance = @event.event_attendances.build(event_attendee: current_user)
    if @event_attendance.save
      redirect_to @event, notice: 'You are new attending this event.'
    else
      redirect_to @event, alert: 'Unable to attend this event.'
    end
  end

  def destroy
    @event_attendance = @event.event_attendances.find_by(event_attendee: current_user)
    if @event_attendance&.destroy
      redirect_to @event, notice: 'You are no longer attending this event.'
    else
      redirect_to @event, alert: 'Unable to cancel attendance.'
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
