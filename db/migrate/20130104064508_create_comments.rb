class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :contents
      t.integer :post_id

      t.timestamps
    end
	
	add_index :comments, [:user_id, :post_id, :created_at]
  end
end
