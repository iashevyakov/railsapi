Rails.application.routes.draw do
  get "/news_rest", to: "news_rest#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
