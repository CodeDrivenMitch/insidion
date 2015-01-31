class FrontController < ApplicationController
  layout 'front'

  def index

  end

  def show_user
    @user = User.find_by_username params[:username]
  end
end
