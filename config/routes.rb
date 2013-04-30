TheGlamourist::Application.routes.draw do
  %w/ about portfolio services login logout expire error /.each do |r|
    get "#{r}(/:id)" => "index##{r}", :as => r
  end

  resources :contacts, only: [ :new, :create, :show ]

  root :to => "index#index"
end
