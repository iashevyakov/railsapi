class NewsItemsJsonApiController < ApplicationController
  
  def index

  	if (params[:search])
	  search = params[:search]
	  key = "%#{search}%"
	  @news_items = NewsItem.where('title LIKE :search OR author LIKE :search OR description LIKE :search OR url LIKE :search', search: key)
	else
	  @news_items = NewsItem.all
	end

	render json: @news_items

  end
end