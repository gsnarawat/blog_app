class HomeController < ApplicationController
  def index
  
      @post = current_user.posts.build if signed_in?
	  @posts = Post.paginate(page: params[:page])
  
  end
  
  
  
end
