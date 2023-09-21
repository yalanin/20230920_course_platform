class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
      t.references :course
      t.string :name, null: false
      t.timestamps
    end
  end
end
