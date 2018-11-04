module Api
  module V1
    class AppsController < Api::V1::ApplicationController
      include TokenAuthorizationConcern

      before_action :set_apps, only: %i(index)

      def index
      end

      private

      def set_apps
        @apps = App.all
      end
    end
  end
end