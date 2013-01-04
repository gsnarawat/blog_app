class CommentsController < ApplicationController
before_filter :signed_in_user, only: [:create]




def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user = current_user
    @comment.save    
    if @comment.save
      flash[:success] = "commented!"
      redirect_to post_path(@post)
	  else
	  flash.now[:error] = "Invalid Comment"
	  redirect_to post_path(@post)
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
