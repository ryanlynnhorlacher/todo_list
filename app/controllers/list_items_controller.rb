class ListItemsController < ApplicationController
	
	def index
		@list_items_not_started = ListItem.where(status: 'Not Started').order(priority: :ASC)
		@list_items_in_progress = ListItem.where(status: 'In-Progress').order(priority: :ASC)
		@list_items_complete = ListItem.where(status: 'Complete').order(priority: :ASC)
	end

	def new
		@list_item = ListItem.new
	end

	def create
		@list_item = ListItem.new(item_params)
		if @list_item.save
			redirect_to list_items_path
		else
			render :new
		end
	end

	def edit
		@list_item = ListItem.find(params[:id])
	end

	def update
		@list_item = ListItem.find(params[:id])
		if @list_item.update(item_params)
			if @list_item.status == 'Complete'
				redirect_to congrats_path
			else
				redirect_to list_items_path
			end
		else
			render :edit
		end
	end

	def destroy
		@list_item = ListItem.find(params[:id])
		@list_item.destroy
		redirect_to list_items_path
	end



	private
	def item_params
		params.require(:list_item).permit(:name, :description, :priority, :status)
	end
end


