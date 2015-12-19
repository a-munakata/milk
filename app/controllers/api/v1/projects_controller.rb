class Api::V1::ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  def index
    @projects = Project.all.order(created_at: :desc)
    render json: @projects
  end

  def show
    if @project.present?
      render json: @project
    else
      render json: { message: 'No project found.' }, status: 404
    end
  end

  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors
    end
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project
    else
      render json: @project.errors
    end
  end

  def destroy
    if @project.destroy
      render json: { message: 'success.' }
    else
      render json: { message: 'fail.' }
    end
  end

  private
    def set_project
      @project = Project.find_by(id: params[:id])
    end

    def project_params
      params.permit(:title)
    end
end