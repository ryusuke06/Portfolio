class AddRowOrderToDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :details, :row_order, :integer
  end
end
