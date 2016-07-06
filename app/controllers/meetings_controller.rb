class MeetingsController < ApplicationController
  before_action :current_user, only: [:create, :destroy]
  
  def create
    @meeting = current_user.meetings.build(meeting_params)
    if @meeting.save
      flash[:success] = "Nice! We sent them an email so you can stay in touch."
      RestClient.post "https://api:key-2462c9d10fd68bcea7e60464e17e7fad"\
        "@api.mailgun.net/v3/sandbox962f74bced9b4f80b260c206f022bf53.mailgun.org/messages",
        :from => "Mailgun Sandbox <postmaster@sandbox962f74bced9b4f80b260c206f022bf53.mailgun.org>",
        :to => "Phil <thespitzer@gmail.com>",
        :subject => "Hello Phil",
        :text => "Congratulations Phil, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  private

    def meeting_params
      params.require(:meeting).permit(:frequency, :invitee, :work_or_play)
    end
  
end
