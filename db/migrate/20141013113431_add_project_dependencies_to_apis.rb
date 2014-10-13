class AddProjectDependenciesToApis < ActiveRecord::Migration
  def change
    add_column :apis, :project_dependencies, :text
  end
end
