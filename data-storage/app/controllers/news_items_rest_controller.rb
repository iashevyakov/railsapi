class NewsItemsRestController < ApplicationController
  
  # def default_serializer_options
  #   {
  #     adapter: nil
  #   }
  # end

  def index

  	if (params[:search])
	  search = params[:search]
	  key = "%#{search}%"
	  @news_items = NewsItem.where('title LIKE :search OR author LIKE :search OR content LIKE :search OR description LIKE :search OR url LIKE :search OR url_to_image LIKE :search', search: key)
	else
	  @news_items = NewsItem.all
	end

	render json: @news_items, adapter: nil

  end
end
