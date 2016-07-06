class MeetingsController < ApplicationController
  before_action :current_user, only: [:create, :destroy]
  
  def create
    @meeting = current_user.meetings.build(meeting_params)
    if @meeting.save
      flash[:success] = "Nice! We sent them an email so you can stay in touch."
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  private

    def meeting_params
      params.require(:meeting).require(:frequency)
      params.require(:meeting).require(:work)
      params.require(:meeting).require(:invitee)
    end
  
end
