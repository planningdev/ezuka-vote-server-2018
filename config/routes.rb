Rails.application.routes.draw do
  resources :apps, only: %i(index show), param: :encrypted_id

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
