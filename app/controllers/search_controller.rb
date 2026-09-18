class SearchController < ApplicationController
  before_action :authenticate_user!

  def index

    if params[:q].present?
      
      @projects = current_user.projects.where(
        "title ILIKE ?", 
        "%#{params[:q]}%"
      )

      @tasks = current_user.tasks.where(
        "tasks.title ILIKE ?", 
        "%#{params[:q]}%"
      )

    else

      @projects = []
      @tasks = []

    end

  end
end
