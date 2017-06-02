class AddElectiveAssignmentsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstElective, :string
    add_column :users, :secondElective, :string
  end
end
