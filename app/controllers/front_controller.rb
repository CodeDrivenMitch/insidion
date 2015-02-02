class FrontController < ApplicationController
  layout 'front'

  def index
    if user_signed_in?
      redirect_to show_user_path(current_user.username)
    end
  end

  def show_user
    @user = User.find_by_username params[:username]
  end
end
