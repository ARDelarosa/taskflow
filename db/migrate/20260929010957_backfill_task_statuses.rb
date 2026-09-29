class BackfillTaskStatuses < ActiveRecord::Migration[8.1]
  def up
    execute <<-SQL
      UPDATE tasks
      SET status = 2
      WHERE completed = TRUE
    SQL
  end

  def down
    execute <<-SQL
      UPDATE tasks
      SET status = 0
      WHERE completed = TRUE
    SQL
  end
end
