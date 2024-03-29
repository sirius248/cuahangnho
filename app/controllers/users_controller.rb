class UsersController < ApplicationController

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

	end

	def notexist
		
	end

	def update_avatar
		params.permit!
		if current_user.update_attribute(:avatar, params[:user][:avatar])
			redirect_to current_user
		else
			render text: "hadfhasdfa"
		end
	end


	def update
		params.permit!
		
			begin
				@user.update_columns(params[:user])
				respond_with @user
			rescue
				respond_with @user
			end
		
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














