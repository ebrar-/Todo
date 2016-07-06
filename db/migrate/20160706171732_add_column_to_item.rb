class AddColumnToItem < ActiveRecord::Migration
  def change
    add_column :items, :is_completed, :boolean , :default => false
  end
end
