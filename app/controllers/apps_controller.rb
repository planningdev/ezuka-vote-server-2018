class AppsController < ApplicationController
  before_action :basic_authentication!, only: %i(index)
  before_action :set_apps, only: %i(index)
  before_action :set_app, only: %i(show edit update)

  def index
    respond_to do |format|
      format.html
      format.csv
      end
    end

  def show
  end

  def edit
  end

  def update
    if @app.update(app_params)
      redirect_to edit_app_path(@app.receipt_number), success: '更新しました。'
    else
      render 'edit'
    end
  end

  private

  def set_apps
    @apps = App.all
  end

  def set_app
    @app = App.find_by(receipt_number: params[:receipt_number])
  end

  def app_params
    params.require(:app).permit(:title, :description, :square_image,  :square_image_cache, images_attributes: %i(id image image_cache _destroy))
  end
end