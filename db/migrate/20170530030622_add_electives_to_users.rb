class AddElectivesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstChoice, :Elective
    add_column :users, :secondChoice, :Elective
    add_column :users, :thirdChoice, :Elective
    add_column :users, :fourthChoice, :Elective
  end
end
