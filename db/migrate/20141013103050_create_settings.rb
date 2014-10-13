class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :api_id
      t.boolean :email_notification
      t.boolean :sms_notification
      t.text :email_ids
      t.text :phone_numbers

      t.timestamps
    end
  end
end
