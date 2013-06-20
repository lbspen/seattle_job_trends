class AddJobPostContentToSnapshot < ActiveRecord::Migration
  def change
    add_column :snapshots, :job_post_content, :string
  end
end
