class CreateWorkoutSets < ActiveRecord::Migration
  def change
    create_table :workout_sets do |t|
      t.references :workout, index: true, foreign_key: true
      t.time :avg_time
      t.integer :weight

      t.timestamps null: false
    end
  end
end
