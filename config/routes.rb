Rails.application.routes.draw do
  get 'contacts/index'
  resources :users
  post "/auth/login", to: "authentication#login"
  post "webhook", to: "notifications#webhook"
end
