class PostsController < ApplicationController
  def index
  end

  def list
    @posts = Post.all
  end

  def new
    @post =  Post.new
  end

  def create
    @post = Post.new(post_params)
    if params[:Retour]
      render :new
     else
       if @post.save
         flash[:notice] = " Tweet posté avec succès" 
         redirect_to posts_path
       else
         render new_post_path
       end
     end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    flash[:danger] = " Tweet supprime" 
     redirect_to posts_path if @post.destroy
    
  end
  private
  def post_params
    params.require(:post).permit(:content)
  end
end
