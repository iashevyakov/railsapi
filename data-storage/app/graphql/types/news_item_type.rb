require 'types/base_scalar'

module Types
  class NewsItemType < Types::BaseObject
  	field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: true
    field :author, String, null: true
    field :url, String, null: true
  end
end
