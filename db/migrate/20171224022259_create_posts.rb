class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :post_title
      t.text :post_body
      t.boolean :public, default: false

      t.timestamps
    end
  end
end
