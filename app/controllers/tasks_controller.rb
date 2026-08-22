class TasksController < ApplicationController
  def new
    @project = current_user.projects.find(params[:project_id])
    @task = @project.tasks.new
  end

  def create
    @project = current_user.projects.find(params[:project_id])
    @task = @project.tasks.new(task_params)

    if @task.save
      redirect_to @project, notice: "Task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = current_user.projects.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def update
    @project = current_user.projects.find(params[:project_id])
    @task = @project.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to @project
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = current_user.projects.find(params[:project_id])
    @task = @project.tasks.find(params[:id])

    @task.destroy
    
    redirect_to @project, notice: "Task was successfully deleted."
  end

def task_params
  params.require(:task).permit(
    :title, 
    :details, 
    :completed, 
    :due_date
    )
end

end
