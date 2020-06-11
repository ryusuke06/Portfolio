class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.references :test, foreign_key: true
      t.text :question
      t.string :first_answer
      t.string :second_answer

      t.timestamps
    end
  end
end
