class AddAttendanceToElectives < ActiveRecord::Migration
  def change
    add_column :electives, :attendance, :integer, default: 0
  end
end
