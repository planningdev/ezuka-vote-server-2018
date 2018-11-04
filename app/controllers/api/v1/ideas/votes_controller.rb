module Api
  module V1
    module Ideas
      class VotesController < Api::V1::ApplicationController
        include TokenAuthorizationConcern

        before_action :set_idea, only: %i(create)

        def create
          current_vote_token.build_idea_vote(voteable: @idea).save!
        end

        private

        def set_idea
          @idea = Idea.find(params[:idea_id])
        end
      end
    end
  end
end