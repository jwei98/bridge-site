class AddElectiveAssignmentsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstElective, :Elective
    add_column :users, :secondElective, :Elective
  end
end
