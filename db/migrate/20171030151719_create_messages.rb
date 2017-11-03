class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, index: true, foreign_key: true
      t.text :content
      t.boolean :sent

      t.timestamps null: false
    end
  end
end
