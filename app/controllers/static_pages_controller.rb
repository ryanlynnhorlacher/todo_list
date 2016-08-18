class StaticPagesController < ApplicationController
  def home
  	@list_items_not_started = ListItem.where(status: 'Not Started').count
	@list_items_in_progress = ListItem.where(status: 'In-Progress').count
	@list_items_complete = ListItem.where(status: 'Complete').count
  end
  def congrats
  end
end
