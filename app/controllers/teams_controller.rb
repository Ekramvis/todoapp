class TeamsController < ApplicationController
	def index 
		@teams = Team.all
	end

	def show
		@team = Team.find(params[:id])
	end

	def new
		@team = Team.new

		render :new
	end

	def create
		@team = Team.new(params[:team])

		if @team.save # REV: !
			flash.notice = "Team Created"
			redirect_to teams_url
		else
			render :new
		end
	end

	def edit
		@team = Team.find(params[:id])

		render :edit
	end

	def update
		@team = Team.find(params[:id])
		@team.update_attributes(params[:team])

		if @team.save
			flash.notice = "Team Saved"
			redirect_to teams_url
		else
			render :edit
		end
	end

	def destroy
		@team = Team.find(params[:id]).destroy

		redirect_to teams_url
	end

end