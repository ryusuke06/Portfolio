class ChangeDiscloseOfTests < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :tests, :disclose, false
  end
end
