require './app/classes/news_fetcher'


class NewsRestController < ApplicationController

  URL = 'https://data-storage-shevyakov.herokuapp.com/news_rest/'
  

  def index
    news_fetcher = NewsFetcher.new(URL)

  	if params[:search]
      news_fetcher.set_keyword(params[:search])
    end

    @news = news_fetcher.get_news()

  end


  private

  def news_rest_params
  	params.require(:news_rest).permit(:search)
  end
end
