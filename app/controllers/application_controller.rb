 class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #CanCan::AccessDenied exception is raised if the the logged in user tries to access a particular action in a controller that he does’nt have permission to 

  rescue_from CanCan::AccessDenied do 
  	 redirect_to root_path, notice: "Unauthorized Access"
  end

end
