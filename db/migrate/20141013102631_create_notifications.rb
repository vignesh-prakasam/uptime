class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :api_id
      t.string :notification_type
      t.text :recipients

      t.timestamps
    end
  end
end
