Rails.application.routes.draw do
  resources :stocks
  resources :book_categories
  resources :books
  resources :search
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
