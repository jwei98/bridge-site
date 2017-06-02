class AddElectivesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstChoice, :string
    add_column :users, :secondChoice, :string
    add_column :users, :thirdChoice, :string
    add_column :users, :fourthChoice, :string
  end
end
