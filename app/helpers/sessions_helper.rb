module SessionsHelper

  def sign_in(user)
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  
  def sign_out
    self.current_user = nil
    @current_user = session[:current_user_id] = nil
  end

 def current_user
 @current_user ||= session[:current_user_id] &&
      User.find_by_id(session[:current_user_id])
 end

 
 def redirect_back_or(default)
    redirect_to a
    a = nil
  end
 
 
  def store_location
    a = request.url
  end

 
end
