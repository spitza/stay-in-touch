class StaticPagesController < ApplicationController
  def home
    if current_user
      @meeting = current_user.meetings.build
    end
  end

  def about
  end
end
