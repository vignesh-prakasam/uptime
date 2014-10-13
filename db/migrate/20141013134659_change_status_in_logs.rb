class ChangeStatusInLogs < ActiveRecord::Migration
  def change
    change_column :logs , :status , :boolean
  end
end
