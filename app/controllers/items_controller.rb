class ItemsController < ApplicationController

	def index
		# REV: An item index is not necassary unless you want to list all the items
		# REV: If you just want to list the items for a specific project in a project
		# REV: view do @project.items.each { |item| link_to item.title, item_url(item.id) }
		# REV: but with <% for erb
		if params.include?(:project_id)
			@items = Item.where(:project_id => params[:project_id])
		else
			@items = Item.all 
		end
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new

		render :new
	end

	def create
		@item = Item.new(params[:item])

		if @item.save # REV: you need a bang!, plain save doesn't raise errors
			flash.notice = "Task Created" # REV: Nice! was too lazy to these myself :(
			redirect_to project_url(@item.project)
		else
			render :new
		end
	end

	def edit
		@item = Item.find(params[:id])

		render :edit
	end

	def update
		@item = Item.find(params[:id])
		@item.update_attributes(params[:item])

		# REV: I'm not sure but I think update_attributes works like create
		# REV: so an additional save is redundant, but I understand the error
		# REV: checking. I wasn't sure how to do that either.
		if @item.save
			flash.notice = "Item Saved"
			redirect_to project_url(@item.project)
		else
			render :edit
		end
	end

	def destroy
		@item = Item.find(params[:id]).destroy

		redirect_to project_url(@item.project)
	end
end
