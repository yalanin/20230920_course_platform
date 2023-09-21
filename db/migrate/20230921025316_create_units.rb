class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.references :chapter
      t.string :name, null: false
      t.string :description
      t.text :content, null: false
      t.timestamps
    end
  end
end
