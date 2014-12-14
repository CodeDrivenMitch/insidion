class BlockController < ApplicationController
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
    @block = Block.new(params[:block].permit(:title, :active))

    case params[:block][:blockable_type]
      when 'Post'
        @blockable = Post.new(params[:block][:post].permit(:excerpt, :content))
      when 'Project'
        @blockable = Project.new(params[:block][:project].permit(:content))
      else
        @blockable = nil
    end

    @blockable.save
    @block.blockable = @blockable
    @block.save

    redirect_to :admin_index
  end

  def update
    @block.title = params[:block][:title]
    @block.active = params[:block][:active] == 1

    if @block.blockable_type == params[:block][:blockable_type] and @blockable != nil
      @blockable = @block.blockable

      @blockable.update_attributes params[:block][@block.blockable_type.downcase.to_sym].permit(:excerpt, :content)
    else
      case params[:block][:blockable_type]
        when 'Post'
          @blockable = Post.new(params[:block][:post].permit(:excerpt, :content))
        when 'Project'
          @blockable = Project.new(params[:block][:project].permit(:content))
        else
          @blockable = nil
      end

      @block.blockable.delete unless @block.blockable.nil?
      @blockable.save
      @block.blockable = @blockable
      @block.save
    end

    redirect_to :admin_index
  end

  private
  def get_block
    @block = Block.find(params[:id])
  end

  def check_login
    true
  end
end
