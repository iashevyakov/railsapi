Rails.application.routes.draw do

  
  # if Rails.env.development?
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/news_graphql"
  # end
  post "/news_graphql", to: "graphql#execute"
  get "/news_json_api", to: "news_items_json_api#index"
  get "/news_rest", to: "news_items_rest#index"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
