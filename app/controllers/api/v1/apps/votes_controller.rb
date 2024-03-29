module Api
  module V1
    module Apps
      class VotesController < Api::V1::ApplicationController
        include TokenAuthorizationConcern

        before_action :set_app, only: %i(create)

        def create
          current_vote_token.build_app_vote(voteable: @app).save!

          render json: {status: "ok"}
        end

        private

        def set_app
          @app = App.find(params[:app_id])
        end
      end
    end
  end
end