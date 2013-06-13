TheGlamourist::Application.routes.draw do
  %w/ about blog services login logout expire error /.each do |r|
    get "#{r}(/:id)" => "index##{r}", as: r
  end

  get 'portfolio' => redirect('https://www.facebook.com/theglamourist/photos_albums')

  resources :contacts, only: [ :new, :create, :show ]

  root 'index#index'
end
