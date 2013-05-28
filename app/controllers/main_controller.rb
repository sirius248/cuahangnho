class MainController < ApplicationController

  def index
  	if current_user 
  		redirect_to user_path(current_user)
  	else
  		redirect_to signup_path
  	end
  end
end
