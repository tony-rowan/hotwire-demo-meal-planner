class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :meal, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
