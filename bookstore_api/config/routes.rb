Rails.application.routes.draw do
  resources :book_categories
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end