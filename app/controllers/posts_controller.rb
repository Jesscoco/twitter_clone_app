class PostsController < ApplicationController
  def index
  end
  def list
    @posts = Post.all
  end
  def new
    
  end
end
