class CreateQuizSets < ActiveRecord::Migration[5.1]
  def change
    create_table :quiz_sets do |t|
      t.string   "name"
      t.timestamps null: false
    end
  end
end
