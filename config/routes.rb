Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace "api" do
    namespace "v1" do
      resources :creatures, only: [:create, :show] do
        resources :meals, only: [:create], controller: "creatures/meals"
        resources :dishes, only: [:index], controller: "creatures/dishes"
        resources :play_times, only: [:create], controller: "creatures/play_times"
        resources :clean_ups, only: [:create], controller: "creatures/clean_ups"
      end
    end
  end
end
