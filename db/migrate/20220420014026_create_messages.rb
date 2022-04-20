class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :post_id
      t.integer :subscriber_id

      t.timestamps
    end
  end
end
