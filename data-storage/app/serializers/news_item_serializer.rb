class NewsItemSerializer < ActiveModel::Serializer

  attributes :id, :title, :author, :description, :url

end
