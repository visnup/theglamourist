TheGlamourist::Application.routes.draw do
  %w/ about services login logout expire error /.each do |r|
    get "#{r}(/:id)" => "index##{r}", as: r
  end

  get 'portfolio' => redirect('https://www.facebook.com/theglamourist/photos_albums')

  get 'blog' => 'posts#index', as: 'posts'
  get 'blog/*link' => 'posts#show', as: 'post'
  resources :contacts, only: [ :new, :create, :show ]

  root 'index#index'
end
