class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :author, foreign_key: { to_table: :users }, null: false
      t.references :post, null: false, foreign_key: true
      t.text :text
      t.integer :comments_counter, default: 0

      t.timestamps
    end
  end
end
