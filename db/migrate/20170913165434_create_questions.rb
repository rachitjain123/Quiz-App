class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :type
      t.string :desc
      t.string :a
      t.string :b
      t.string :c
      t.string :d
      t.references :QuizSet, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
