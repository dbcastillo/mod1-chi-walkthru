class CreateExerciseTable < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :type
      t.integer :sets
    end
  end
end
