class DefaultController < ApplicationController
  def index
    @blocks = Block.all
  end
end
