module SessionsHelper
	def sign_in(user)
    cookies[:remember_token] = { value:   user.remember_token,
                             			expires: 12.hours.from_now.utc }
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:remember_token][:value])
  end
  
end
