class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :electives, :capcity, :capacity
  end
end
