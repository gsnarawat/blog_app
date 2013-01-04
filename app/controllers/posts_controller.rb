class PostsController < ApplicationController

 before_filter :signed_in_user, only: [:new]



 def new   
  @post = Post.new
  end


def show
    @post = Post.find(params[:id])
  end


  def create

  @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "post created!"
      redirect_to root_url
	  else
	  render 'new'
	  end  
  end
  
  private 
  def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
 end

end
