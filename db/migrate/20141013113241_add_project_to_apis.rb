class AddProjectToApis < ActiveRecord::Migration
  def change
    add_column :apis, :project, :string
  end
end
