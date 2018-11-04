module Types
  class QueryType < Types::BaseObject

    field :news_items, [NewsItemType], null: false do
      argument :search, String, required: false
    end

    def news_items(search:nil)
      if search
        key = "%#{search}%"
        NewsItem.where('title LIKE :search OR author LIKE :search OR description LIKE :search OR url LIKE :search', search: key)
      else
        NewsItem.all
      end
    end

  end
end
