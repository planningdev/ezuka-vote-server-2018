module Api
  module V1
    class VoteTokensController < Api::V1::ApplicationController
      before_action :set_vote_token

      def show
      end

      private

      def set_vote_token
        @vote_token = VoteToken.find_by!(token: params[:token])
      end
    end
  end
end