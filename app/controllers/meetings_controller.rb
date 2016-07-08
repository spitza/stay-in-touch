class MeetingsController < ApplicationController
  before_action :current_user, only: [:create, :destroy]
  
  def create
    @meeting = current_user.meetings.build(meeting_params)
    if @meeting.save
      RestClient.post "https://api:#{ENV["MAILGUN_API_KEY"]}"\
      "@api.mailgun.net/v3/mg.stayintouch.link/messages",
      :from => "Stay in Tizouch <mailgun@mg.stayintouch.link>",
      :to => "thespitzer@gmail.com",
      :subject => "Hello phillll",
      :text => "Testing some Mailgun awesomness yuip yupyup !"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  def show
    @meeting = Meeting.find(params[:id])
  end
  
  def accept
    @meeting = Meeting.find(params[:id])
    @meeting.update_attributes confirmed: true
    redirect_to root_url
  end
  
  private

    def meeting_params
      params.require(:meeting).permit(:frequency, :invitee, :work_or_play)
    end
  
end
