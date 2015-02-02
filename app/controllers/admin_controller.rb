class AdminController < ApplicationController
  before_action :check_login
  layout 'front'

  def index
    @blocks = Block.where(:user => current_user)
  end

  private
  def check_login
    true
  end
end
