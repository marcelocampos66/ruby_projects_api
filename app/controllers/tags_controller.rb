class TagsController < ApplicationController
  before_action :set_tag, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # GET /tags or /tags.json
  def index
    tags = Tag.all
    render json: {
      status: 'SUCCESS',
      message:'Tags loaded',
      data: tags,
    }, status: :ok
  end

  # GET /tags/1 or /tags/1.json
  def show
    tag = Tag.find(params[:id])
    render json: {
      status: 'SUCCESS',
      message:'Tag loaded',
      data: tag,
    }, status: :ok
  end

  # POST /tags or /tags.json
  def create
    tag = Tag.new(tag_params)
    if tag.save
      render json: {
        status: 'SUCCESS',
        message:'Tag saved',
        data: tag,
      }, status: :ok
    else
      render json: {
        status: 'ERROR',
        message:'Tag not saved',
        data: tag.errors,
      }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tags/1 or /tags/1.json
  def update
    tag = Tag.find(params[:id])
    if tag.update(tag_params)
      render json: {
        status: 'SUCCESS',
        message: 'Tag updated',
        data: tag,
      }, status: :ok
    else
      render json: {
        status: 'ERROR',
        message: 'Tag not updated',
        data: tag.errors,
      }, status: :unprocessable_entity
    end
  end

  # DELETE /tags/1 or /tags/1.json
  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    render json: {
      status: 'SUCCESS',
      message: 'Tag succesfully deleted'
    }, status: :ok
  end

  private
    # Only allow a list of trusted parameters through.
    def tag_params
      params.require(:tag).permit(:name, :project_id)
    end

    def not_found
      render json: { error: 'tags not found' }, status: :not_found       
    end
end
