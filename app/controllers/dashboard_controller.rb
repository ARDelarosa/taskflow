class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = current_user.projects

    @active_tasks = current_user.tasks.where.not(status: :completed)
    @completed_tasks = current_user.tasks.where(status: :completed)

    @overdue_tasks = current_user.tasks
      .where.not(status: :completed)
      .where("tasks.due_date < ?", Date.current)

    @upcoming_tasks = current_user.tasks
      .where.not(status: :completed)
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
