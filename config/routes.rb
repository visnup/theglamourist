TheGlamourist::Application.routes.draw do
  %w/ about portfolio services login logout expire error /.each do |r|
    match r => "index##{r}", :as => r
  end

  resources :contacts, only: [ :new, :create, :show ]

  %w/ posts blog /.each do |path|
    match "/#{path}.:format" => redirect('http://blog.theglamourist.com/rss.xml')
    match "/#{path}" => redirect('http://blog.theglamourist.com')
    match "/#{path}/:id" => redirect('http://blog.theglamourist.com')
  end
  #resources :posts, :path => 'blog'

  root :to => "index#index"
end
