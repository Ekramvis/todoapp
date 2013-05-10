class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new

		render :new
	end

	def create
		@user = User.new(params[:user])

		if @user.save
			flash.notice = "User Created"
			redirect_to users_url
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])

		render :edit
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(params[:user])

		if @user.save
			flash.notice = "User Saved"
			redirect_to users_url
		else
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id]).destroy

		redirect_to users_url 
	end 

end