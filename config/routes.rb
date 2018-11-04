Rails.application.routes.draw do
  mount GrapeSwaggerRails::Engine => "/swagger"

  namespace :api do
    namespace :v1 do
      resources :vote_tokens, only: %i(show), param: :token
    end
  end
end
