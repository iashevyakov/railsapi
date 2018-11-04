class NewsItemsJsonApiController < ApplicationController
  include NewsItemsJsonApiHelper

  def index

	@news_items = filter_news NewsItem.all, params[:search]
	@news_items = paginate @news_items, params[:page]

	render json: @news_items, adapter: :json_api

  end
end