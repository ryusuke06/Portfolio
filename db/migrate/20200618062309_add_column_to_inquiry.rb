class AddColumnToInquiry < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :inquiries, :read, 0
  end
end
