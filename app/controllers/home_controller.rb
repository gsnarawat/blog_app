class HomeController < ApplicationController
  def index
  
      @post = current_user.posts.build if signed_in?
	  @posts = Post.paginate(page: params[:page], :per_page => 7)
  
  end
  
  
  
end
