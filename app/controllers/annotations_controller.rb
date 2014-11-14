class AnnotationsController < ApplicationController
  before_action :set_annotation, only: [:show, :edit, :update, :destroy]

  def index
    @annotations = Annotation.all
    respond_with(@annotations)
  end

  def show
    respond_with(@annotation)
  end

  def new
    @annotation = Annotation.new
    respond_with(@annotation)
  end

  def edit
  end

  def create
    @annotation = Annotation.new(annotation_params)
    @annotation.save
    respond_with(@annotation)
  end

  def update
    @annotation.update(annotation_params)
    respond_with(@annotation)
  end

  def destroy
    @annotation.destroy
    respond_with(@annotation)
  end

  private
    def set_annotation
      @annotation = Annotation.find(params[:id])
    end

    def annotation_params
      params.require(:annotation).permit(:title, :date, :content)
    end
end
