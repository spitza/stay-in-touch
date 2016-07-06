class StaticPagesController < ApplicationController
  def home
    @meeting = current_user.meetings.build if current_user
  end

  def about
  end
end
