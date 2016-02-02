Rails.application.routes.draw do
  get 'auth0/callback'

  get 'auth0/failure'

  resources :exercises
  resources :sleeps
  resources :steps
  resources :med_coverages
  resources :prescriptions
  resources :visits
  resources :rx_alerts
  devise_for :users

  get  "/dashboard" => "userdashboard#show"
  get  "/ehr" => "ehr#show"
  get "/health" => "health_data#show"
  get '/txt', to: 'twilio#send_txt', as: 'txt'

  get "/auth/auth0/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"

  root to: "home#index"

end
