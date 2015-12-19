class Api::V1::TodosController < ApplicationController
  before_action :set_project, only: [:index]
  before_action :set_todo, only: [:show, :update, :destroy]

  def index
    if @project.present?
      @todos = @project.todos.order(created_at: :desc)
      render json: @todos
    else
      render json: { message: "No project has found with ID '#{params[:project_id]}'." }, status: 404
    end
  end

  def show
    if @todo.present?
      render json: @todo
    else
      render json: { message: "No todo has found with ID  '#{params[:id]}'." }, status: 404
    end
  end

  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors
    end
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.project_id = params[:project_id]

    if @todo.save
      render json: @todo
    else
      render json: @todo.errors
    end
  end

  def destroy
    if @todo.destroy
      render json: { status: 'success' }
    else
      render json: @todo.errors
    end
  end

  private
    def set_project
      @project = Project.find_by(id: params[:project_id])
    end

    def set_todo
      @todo = Todo.find_by(id: params[:id])
    end

    def todo_params
      params.permit(:title, :project_id, :is_completed, :completed_at)
    end
end