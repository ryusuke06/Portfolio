class CreateAssessments < ActiveRecord::Migration[5.2]
  def change
    create_table :assessments do |t|
      t.integer :user_id, foreign_key: true
      t.integer :test_id, foreign_key: true
      t.integer :rate
      t.text :review

      t.timestamps
    end
  end
end
