class AppsController < ApplicationController
  before_action :basic_authentication!, only: %i(index)
  before_action :set_apps, only: %i(index)
  before_action :set_app, only: %i(show edit update )

  def index
  end

  def show
  end

  def edit
  end

  def update
    if @app.update(app_params)
      redirect_to edit_app_path(@app), success: '更新しました。'
    else
      render 'edit'
    end
  end

  private

  def set_apps
    @apps = App.all
  end

  def set_app
    @app = App.find_by_encrypted_id(params[:encrypted_id])
  end

  def app_params
    params.require(:app).permit(:title, :description, images_attributes: %i(id image image_cache _destroy))
  end
end