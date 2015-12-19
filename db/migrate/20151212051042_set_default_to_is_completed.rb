class SetDefaultToIsCompleted < ActiveRecord::Migration
  def change
    change_column_default :todos, :is_completed, false
  end
end
