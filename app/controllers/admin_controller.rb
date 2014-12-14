class AdminController < ApplicationController
  before_action :check_login

  def index
    @blocks = Block.all
  end

  private
  def check_login
    true
  end
end
