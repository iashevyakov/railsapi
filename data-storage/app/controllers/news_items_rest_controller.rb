class NewsItemsRestController < ApplicationController
  include NewsItemsJsonApiHelper

  def index

    @news_items = filter_news NewsItem.all, params[:search]

    render json: @news_items, adapter: nil

  end
end
