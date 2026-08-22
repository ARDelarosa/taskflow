class ProjectsController < ApplicationController
  before_action :authenticate_user!
  def index
    @projects = current_user.projects
  end

  def show
    @project = current_user.projects.find(params[:id])
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
    @project = current_user.projects.find(params[:id])
  end

  def update
    @project = current_user.projects.find(params[:id])
    
    if @project.update(project_params)
      redirect_to @project, notice: "Project was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy

    redirect_to projects_path, notice: "Project was successfully deleted."
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
