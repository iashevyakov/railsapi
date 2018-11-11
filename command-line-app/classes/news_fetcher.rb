require 'httparty'
require 'json'

class NewsFetcher

  def initialize(url)
    @url = url
    @keyword=""
  end

  def set_keyword(keyword)
  	@keyword = keyword
  end

  def get_news()
  	if @keyword
      request_path = @url + '?search=' + @keyword
      response = HTTParty.get(request_path)
    else
      response = HTTParty.get(@url)
    end
    return JSON.parse(response.body)
  end



end