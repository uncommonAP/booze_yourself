Rails.application.routes.draw do
  root "static_files#index"

  get '*path', to: 'static_files#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
