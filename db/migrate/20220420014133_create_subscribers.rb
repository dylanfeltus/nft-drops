class CreateSubscribers < ActiveRecord::Migration[6.0]
  def change
    create_table :subscribers do |t|
      t.string :wallet
      t.string :transaction_hash
      t.string :webhook_url
      t.datetime :expires_at
      t.boolean :active, null: false, default: false

      t.timestamps
    end
    add_index :subscribers, :expires_at
  end
end
