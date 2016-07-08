class StaticPagesController < ApplicationController
  
  def home
    if current_user
      @meeting = current_user.meetings.build
      @meetings = Meeting.where("user_id = ? OR invitee = ?", current_user.id, current_user.email).paginate(page: params[:page])
    end
  end

  def about
  end
  
end
