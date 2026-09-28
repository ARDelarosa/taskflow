class Task < ApplicationRecord
  belongs_to :project

  enum :priority,  {
    low: 0,
    medium: 1,
    high: 2
  }

  validates :title, presence: true, length: { maximum: 100 }
  validates :details, length: { maximum: 500 }
end
