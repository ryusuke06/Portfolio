class ChangeAccountOfUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :users, :account, true
  end
end
