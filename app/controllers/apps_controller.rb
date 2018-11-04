class AppsController < ApplicationController
  before_action :basic_authentication!, only: %i(index)
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
    @app = App.find_by_encrypted_id(params[:encrypted_id])
  end
end