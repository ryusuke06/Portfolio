class AddColumnToAssessment < ActiveRecord::Migration[5.2]
  def change
    add_column :assessments, :title, :string
  end
end
