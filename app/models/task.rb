class Task < ApplicationRecord
  belongs_to :project

  validates :title, presence: true, length: { maximum: 100 }
  validates :details, length: { maximum: 500 }
end
