class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = current_user.projects

    @active_tasks = current_user.tasks.where(completed: false)
    @completed_tasks = current_user.tasks.where(completed: true)

    @overdue_tasks = current_user.tasks
      .where(completed: false)
      .where("tasks.due_date < ?", Date.current)

    @upcoming_tasks = current_user.tasks
      .where(completed: false)
      .where(
        "tasks.due_date >= ? OR tasks.due_date IS NULL",
        Date.current
      )
      .order(
        Arel.sql("tasks.due_date IS NULL, tasks.due_date ASC")
      )
      .limit(5)
  end
end
