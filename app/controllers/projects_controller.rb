class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new

		render :new
	end

	def create
		@project = Project.new(params[:project])

		if @project.save
			flash.notice = "Project saved"
			redirect_to projects_url
		else
			render :new
		end
	end

	def edit
		@project = Project.find(params[:id])
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