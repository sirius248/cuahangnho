class UsersController < ApplicationController

	# caches_page :notexist, :show

	before_filter :find_user, :only => [:show, :edit, :update, :destroy]

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			flash[:notice] = "Tạo Tài Khoản Thành Công"
			redirect_to root_url
		else
			render 'new'
		end
	end

	def show
	end

	def notexist
		
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def find_user
		begin
			@user = User.find_by_slug!(params[:id])
			fresh_when :etag => @user
		rescue
			render 'notexist'
		end
	end

end
