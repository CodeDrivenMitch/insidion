class BlockController < ApplicationController
  layout 'front'
  before_action :get_block, :only => [:edit, :destroy, :update]
  before_action :check_login

  def post
    @post = Post.find(params[:id])
    render :layout => false
  end

  def project
    @project = Project.find(params[:id])
    render :layout => false
  end

  def edit
    @action = :update
  end

  def new
    @action = :create
    @block = Block.new
  end

  def destroy
    if @block.delete
      flash[:success] = 'Block succesfully deleted'
    else
      flash[:error] = 'Something went wrong with deleting block with id ' + params[:id] + '!'
    end

    redirect_to :admin_index
  end

  def create
    @block = Block.new block_params
    @block.blockable_attributes= params[:blockable_attributes]
    @block.user = current_user
    Rails.logger.info @block.to_yaml
    if @block.valid?
      @block.save

      redirect_to :admin_index
    end
    render :new
  end

  def update
    @block.update_attributes!(block_params)
    redirect_to :admin_index
  end

  private

  # BEFORE ACTION METHODS
  def get_block
    @block = Block.find(params[:id])
  end

  def check_login
    true
  end

  # HELPERS


  # STRONG PARAMETER FUNCTIONS
  def block_params
    params.require(:block).permit(:title, :active,:content, :blockable_type, block_images_attributes: [:image],
    blockable_attributes: [
        :content,
        :excerpt
    ])
  end
end
