class ChangeRateOfAssessment < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :assessments, :rate, 0
  end
end
