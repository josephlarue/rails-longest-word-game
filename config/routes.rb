Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  Rails.application.routes.draw do
    get "new", to: "games#new"
  end
  Rails.application.routes.draw do
    post "score", to: "games#score"
  end
end
