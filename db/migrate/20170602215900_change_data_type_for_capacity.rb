class ChangeDataTypeForCapacity < ActiveRecord::Migration
    def up
        change_column :electives, :capacity, :integer
    end

    def down
        change_column :electives, :capacity, :string
    end
end
