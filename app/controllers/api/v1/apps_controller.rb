module Api
  module V1
    class AppsController < Api::V1::ApplicationController
      include TokenAuthorizationConcern

      before_action :set_apps, only: %i(index)
      before_action :set_app, only: %i(show)

      def index
      end

      def show
      end

      private

      def set_apps
        @apps = App.all
      end

      def set_app
        @app = App.find(params[:id])
      end
    end
  end
end