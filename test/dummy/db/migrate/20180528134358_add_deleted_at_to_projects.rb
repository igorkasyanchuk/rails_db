class AddDeletedAtToProjects < ActiveRecord::Migration[4.2]
  def change
    add_column :projects, :deleted_at, :datetime
    add_index :projects, :deleted_at
  end
end
