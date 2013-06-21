class ChangeJobPostContentDataType < ActiveRecord::Migration
  def up
   change_column :snapshots, :job_post_content, :text
  end

  def down
   change_column :snapshots, :job_post_content, :string
  end
end
