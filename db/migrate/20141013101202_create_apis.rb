class CreateApis < ActiveRecord::Migration
  def change
    create_table :apis do |t|
      t.string :name
      t.string :url
      t.text :expected_response
      t.string :method_type

      t.timestamps
    end
  end
end
