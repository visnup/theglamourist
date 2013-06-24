TheGlamourist::Application.routes.draw do
  %w/ about services login logout expire error /.each do |r|
    get "#{r}(/:id)" => "index##{r}", as: r
  end

  get 'portfolio' => redirect('https://www.facebook.com/theglamourist/photos_albums')

  resources :contacts, only: [ :new, :create, :show ]
  get 'blog' => 'posts#index', as: 'posts'
  get 'blog/*link' => 'posts#show', as: 'post'
  post 'blog' => 'posts#create'

  root 'index#index'
end
