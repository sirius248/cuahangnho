class SessionsController < ApplicationController
	def new
	end

	def create

		user = User.find_by(email: params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			session[:current_user_id] = user.id
			flash[:notice] = "Đăng nhập thành công."
			redirect_to user_path(user) 
		else
			flash[:error] = 'Email không tồn tại / Sai mật khẩu' 
      render 'new'
		end

	end

	def destroy
		session[:current_user_id] = nil
		flash[:notice] = "Bạn đã thoát khỏi hệ thống."
		redirect_to root_url
	end


end
