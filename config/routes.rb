Rails.application.routes.draw do
  mount GrapeSwaggerRails::Engine => "/swagger"

  namespace :api do
    namespace :v1 do
      resources :vote_tokens, only: %i(show), param: :token
      resources :apps, only: %i(index) do
        resource :vote, only: %i(create), module: :apps
      end
      resources :ideas, only: %i(index)
    end
  end
end
