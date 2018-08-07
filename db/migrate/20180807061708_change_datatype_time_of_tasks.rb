class ChangeDatatypeTimeOfTasks < ActiveRecord::Migration[5.2]
  def change
  	change_column :tasks, :time, :time
  end
end
