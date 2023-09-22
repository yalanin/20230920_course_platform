class AddDeletedAtToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :deleted_at, :datetime
    add_index :courses, :deleted_at
    add_column :chapters, :deleted_at, :datetime
    add_index :chapters, :deleted_at
    add_column :units, :deleted_at, :datetime
    add_index :units, :deleted_at
  end
end
