class IdeasController < ApplicationController
  before_action :basic_authentication!, only: %i(index)
  before_action :set_ideas, only: %i(index)
  before_action :set_idea, only: %i(show edit update)

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
    if @idea.update(idea_params)
      redirect_to edit_idea_path(@idea.receipt_number), success: '更新しました。'
    else
      render 'edit'
    end
  end

  private

  def set_ideas
    @ideas = Idea.all
  end

  def set_idea
    @idea = Idea.find_by(receipt_number: params[:receipt_number])
  end

  def idea_params
    params.require(:idea).permit(:title, :description, :square_image,  :square_image_cache, images_attributes: %i(id image image_cache _destroy))
  end
end
