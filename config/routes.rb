TheGlamourist::Application.routes.draw do
  %w/ about services shop login logout expire error /.each do |r|
    get "#{r}(/:id)", to: "index##{r}", as: r
  end

  get 'portfolio', to: redirect { |_, req|
    if req.env['X_MOBILE_DEVICE'] == 'iPhone'
      'https://m.facebook.com/theglamourist?v=photos'
    else
      'https://www.facebook.com/theglamourist/photos_albums'
    end
  }

  resources :contacts, only: [ :new, :create, :show ]

  constraints subdomain: 'blog' do
    get '/', to: redirect(path: '/blog', subdomain: nil)
    get '/rss', to: redirect('http://feeds.feedburner.com/theglamourist/sTqj')
    get '/*link', to: redirect(path: '/blog/%{link}', subdomain: nil)
  end

  get 'blog', to: 'posts#index', as: 'posts'
  get 'blog/categories/:category', to: 'posts#index', as: 'category'
  get 'blog/*link', to: 'posts#show', as: 'post'
  post 'blog', to: 'posts#create'

  get 'theworkshop', to: 'posts#show', defaults: { link: '2014/10/29/the-workshop' }, as: 'workshop'

  root 'index#index'
end
