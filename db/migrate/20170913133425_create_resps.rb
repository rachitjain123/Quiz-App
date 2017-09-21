class CreateResps < ActiveRecord::Migration[5.0]
  def change
    create_table :resps do |t|
      t.text :response
      t.references :Que, index: true, foreign_key: true
      t.references :User, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
