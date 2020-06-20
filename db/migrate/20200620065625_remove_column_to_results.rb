class RemoveColumnToResults < ActiveRecord::Migration[5.2]
  def change
    remove_column :results, :pattern, :integer
  end
end
