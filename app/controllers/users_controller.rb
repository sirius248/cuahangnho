class UsersController < ApplicationController

	# caches_page :notexist, :show
	respond_to :html, :json

	before_filter :find_user, :only => [:show, :edit, :update, :destroy]
	skip_before_filter :verify_authenticity_token

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
		fresh_when(:etag => @user)
	end

	def notexist
		
	end

	def update
		params.permit!
		@user.update_attributes(params[:user]) 
  	respond_with @user
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def find_user
		begin
			@user = User.find_by_slug!(params[:id])
		rescue
			render 'notexist'
		end
	end



end














