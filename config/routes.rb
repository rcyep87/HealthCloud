Rails.application.routes.draw do
  resources :exercises
  resources :sleeps
  resources :steps
  resources :med_coverages
  resources :prescriptions
  resources :visits
  devise_for :users

  get  "/dashboard" => "userdashboard#show"
  get  "/ehr" => "ehr#show"

  root to: "home#index"

end
