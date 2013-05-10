class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new(:team_id => params[:team_id])

		render :new
	end

	def create
		@project = Project.new(params[:project])

		if @project.save
			flash.notice = "Project Created"
			redirect_to projects_url
		else
			render :new
		end
	end

	def edit
		@project = Project.find(params[:id])

		render :edit
	end

	def update
		@project = Project.find(params[:id])
		@project.update_attributes(params[:project])

		if @project.save
			flash.notice = "Project Saved"
			redirect_to projects_url
		else
			render :edit
		end
	end


	def destroy
		Project.find(params[:id]).destroy
	end
end