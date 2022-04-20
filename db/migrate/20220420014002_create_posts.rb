class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.datetime :sent_at
      t.datetime :scheduled_for

      t.timestamps
    end
    add_index :posts, :sent_at
    add_index :posts, :scheduled_for
  end
end
