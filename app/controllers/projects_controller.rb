class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # GET /projects or /projects.json
  def index
    data = []
    projects = Project.all
    for project in projects do
      tags = Tag.where(project_id: project.id).all
      object = {
        project: project,
        tags: tags,
      }
      data.push(object)
    end
    render json: {
      status: 'SUCCESS',
      message:'Projects loaded',
      data: data,
    }, status: :ok
  end

  # GET /projects/1 or /projects/1.json
  def show
    project = Project.find(params[:id])
    if project
      tags = Tag.where(project_id: project.id).all
      render json: {
        status: 'SUCCESS',
        message:'Project loaded',
        data: project,
        tags: tags,
      }, status: :ok
    else
      render json: {
        status: 'ERROR',
        message:'Project not found',
        data: project.errors,
      }, status: :not_found
    end
  end

  # POST /projects or /projects.json
  def create
    project = Project.new(project_params)
    if project.save
      render json: {
        status: 'SUCCESS',
        message:'Project saved',
        data: project,
      }, status: :ok
    else
      render json: {
        status: 'ERROR',
        message:'Project not saved',
        data: project.errors,
      }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    project = Project.find(params[:id])
    if project.update(project_params)
      render json: {
        status: 'SUCCESS',
        message: 'Project updated',
        data: project,
      }, status: :ok
    else
      render json: {
        status: 'ERROR',
        message: 'Project not updated',
        data: project.errors,
      }, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    project = Project.find(params[:id])
    project.destroy
    render json: {
      status: 'SUCCESS',
      message: 'Project succesfully deleted'
    }, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :language, :framework, :description, :image)
    end

    def not_found
      render json: { error: 'project not found' }, status: :not_found       
    end
end
