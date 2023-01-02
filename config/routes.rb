Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'api/list', to: 'main_pages#list'
  get 'api/page/:id', to: 'main_pages#page'
  get 'api/side/:id', to: 'side_panel#side'
  post 'api/edit/:id', to: 'edition#add_or_edit'
  post 'api/check_id', to: 'general#check_id'
  delete 'api/delete/:id', to: 'edition#delete'
end
