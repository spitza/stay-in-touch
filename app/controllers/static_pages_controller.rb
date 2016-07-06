class StaticPagesController < ApplicationController
  def home
    @meeting = current_user.meetings.build
  end

  def about
  end
end
