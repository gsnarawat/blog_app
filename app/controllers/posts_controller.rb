class PostsController < ApplicationController

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

end
