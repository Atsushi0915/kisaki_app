class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :user_id
      t.string :post_image
      t.integer :del_flag

      t.timestamps
    end
  end
end
