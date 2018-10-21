namespace :news_items do
  desc "TODO"
  task fetch: :environment do
	newsapi = News.new(ENV["NEWS_API_KEY"])

    yesterday = (Date.today - 1.day).strftime("%Y-%m-%d")
    today = Date.today.strftime("%Y-%m-%d")

    all_articles = newsapi.get_everything(
      sources: "the-verge, bbc-news",
      from: yesterday.to_s,
      to: today.to_s
    )

    all_articles.each do |article|
      NewsItem.create(
        title: article.title,
        description: article.description,
        author: article.author,
        url: article.url,
        url_to_image: article.urlToImage,
        published_at: article.publishedAt
      )
    end
  end
end
