class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.references :user, index: true, foreign_key: true
      t.string :workout_type
      t.string :name
      t.integer :set_amount
      t.string :weight
      t.time :avg_time
      t.datetime :weekday
      t.boolean :weekly
      t.integer :day_index

      t.timestamps null: false
    end
  end
end
