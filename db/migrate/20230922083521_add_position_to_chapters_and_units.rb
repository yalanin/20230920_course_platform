class AddPositionToChaptersAndUnits < ActiveRecord::Migration[7.0]
  def change
    add_column :chapters, :position, :integer, null: false, unsigned: true, default: 1
    add_column :units, :position, :integer, null: false, unsigned: true, default: 1
  end
end
