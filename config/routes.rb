Rails.application.routes.draw do
  resources :apps, only: %i(index edit update), param: :receipt_number
  resources :ideas, only: %i(index edit update), param: :receipt_number

  namespace :api, format: 'json' do
    namespace :v1 do
      resources :vote_tokens, only: %i(show), param: :token
      resources :apps, only: %i(index show) do
        resource :vote, only: %i(create), module: :apps
      end
      resources :ideas, only: %i(index show) do
        resource :vote, only: %i(create), module: :ideas
      end
    end
  end
end
