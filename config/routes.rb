TheGlamourist::Application.routes.draw do
  %w/ about services login logout expire error /.each do |r|
    get "#{r}(/:id)" => "index##{r}", as: r
  end

  get 'portfolio' => redirect('https://www.facebook.com/theglamourist/photos_albums')

  get 'blog' => 'blog#index', as: 'blog_index'
  get 'blog/*url' => 'blog#show', as: 'blog_show'

  resources :contacts, only: [ :new, :create, :show ]

  root 'index#index'
end
