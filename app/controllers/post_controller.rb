class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
    @block = @post.block
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post].permit(:content, :block))
  end
end
