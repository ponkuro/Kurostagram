class TopController < ApplicationController
  def index
    if user_signed_in?
      redirect_to user_url(current_user.id)
    else
      redirect_to new_user_registration_url
    end
  end
end
