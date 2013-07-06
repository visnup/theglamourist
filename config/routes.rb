TheGlamourist::Application.routes.draw do
  %w/ about services login logout expire error /.each do |r|
    get "#{r}(/:id)" => "index##{r}", as: r
  end

  get 'portfolio' => redirect { |_, req|
    if req.env['X_MOBILE_DEVICE'] == 'iPhone'
      'https://m.facebook.com/theglamourist?v=photos'
    else
      'https://www.facebook.com/theglamourist/photos_albums'
    end
  }

  resources :contacts, only: [ :new, :create, :show ]

  get 'blog' => 'posts#index', as: 'posts'
  get 'blog/categories/:category' => 'posts#index', as: 'category'
  get 'blog/*link' => 'posts#show', as: 'post'
  post 'blog' => 'posts#create'

  root 'index#index'
end
