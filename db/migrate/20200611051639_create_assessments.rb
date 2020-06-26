class CreateAssessments < ActiveRecord::Migration[5.2]
  def change
    create_table :assessments do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.integer :rate
      t.text :review

      t.timestamps
    end
  end
end
