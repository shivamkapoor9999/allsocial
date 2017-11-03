class ChangeColumnDefault < ActiveRecord::Migration
  def change
  	change_column_default :messages, :sent, false
  end
end
