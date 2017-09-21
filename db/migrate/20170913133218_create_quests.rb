class CreateQuests < ActiveRecord::Migration[5.0]
  def change
    create_table :quests do |t|
      t.string :type
      t.text :desc
      t.text :a
      t.text :b
      t.text :c
      t.text :d
      t.references :QuizSet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
