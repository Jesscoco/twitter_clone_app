class PostsController < ApplicationController
  before_action :set_post, only: [:update, :destroy, :edit, :show]

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
  end

  def destroy
    flash[:danger] = " Tweet supprime" 
    redirect_to posts_path if @post.destroy
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = " Tweet modifié avec succès" 
      redirect_to post_path
    else
      render :edit 
    end
  end

  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end
  
  private
  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
