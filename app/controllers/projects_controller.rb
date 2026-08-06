class ProjectsController < ApplicationController
  before_action :authenticate_user!
  def index
    @projects = current_user.projects
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      redirect_to projects_path, notice: "Project was successfully created."
    else
      Rails.logger.debug @project.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def project_params
      params.require(:project).permit(
        :title, 
        :description, 
        :due_date
        )
    end
end
