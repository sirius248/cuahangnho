
class ApplicationController < ActionController::Base
  include ActionController::Caching
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?

  # include SessionsHelper
  def current_user
    @current_user ||=  User.find_by_id(session[:current_user_id])
  end

  def signed_in?
    !current_user.nil?
  end

  def dropbox_session
    dbsession = DropboxSession.new(APP_KEY, APP_SECRET)
    dbsession.get_request_token
    authorize_url = dbsession.get_authorize_url(action: 'dropbox_callback')
  end

  def dropbox_callback
    
  end

end
