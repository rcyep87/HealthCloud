Rails.application.routes.draw do
  resources :exercises
  resources :sleeps
  resources :steps
  resources :med_coverages
  resources :prescriptions
  resources :visits
  resources :rx_alerts
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  get  "/dashboard" => "userdashboard#show"
  get  "/ehr" => "ehr#show"
  get "/health" => "health_data#show"
  get '/txt', to: 'twilio#send_txt', as: 'txt'

  match "auth/:provider/callback" => "sessions#create", via: [:get]

  root to: "home#index"

end
