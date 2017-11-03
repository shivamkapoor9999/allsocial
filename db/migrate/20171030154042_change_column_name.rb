class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :messages, :sent, :received
  end
end
