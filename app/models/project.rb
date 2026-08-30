class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  def total_tasks
    tasks.count
  end
  
  def completed_tasks
      tasks.where(completed: true).count
  end

  def progress_percentage
    return 0 if total_tasks.zero?

    (completed_tasks.to_f / total_tasks.to_f * 100).round(2)
  end
end
