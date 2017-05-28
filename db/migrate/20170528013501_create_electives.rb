class CreateElectives < ActiveRecord::Migration
  def change
    create_table :electives do |t|
      t.string :title
      t.string :description
      t.string :capcity

      t.timestamps null: false
    end
  end
end
