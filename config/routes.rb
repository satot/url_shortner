Rails.application.routes.draw do
  resources :short_urls
  get 'r/:id' => 'redirect#show', constraints: {id: /\w{6}/}
end
