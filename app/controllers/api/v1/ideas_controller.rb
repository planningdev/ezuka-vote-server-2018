module Api
  module V1
    class IdeasController < Api::V1::ApplicationController
      include TokenAuthorizationConcern

      before_action :set_ideas, only: %i(index)

      def index
      end

      private

      def set_ideas
        @ideas = Idea.all
      end
    end
  end
end