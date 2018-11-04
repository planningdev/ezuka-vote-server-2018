module Api
  module V1
    class IdeasController < Api::V1::ApplicationController
      include TokenAuthorizationConcern

      before_action :set_ideas, only: %i(index)
      before_action :set_idea, only: %i(show)
      def index
      end

      def show
      end

      private

      def set_ideas
        @ideas = Idea.all
      end

      def set_idea
        @idea = Idea.find(params[:id])
      end
    end
  end
end