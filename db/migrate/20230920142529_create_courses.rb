class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.references :teacher
      t.string :name, null: false
      t.text :description
      t.timestamps
    end
  end
end
