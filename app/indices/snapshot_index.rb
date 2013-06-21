ThinkingSphinx::Index.define :snapshot, :with => :active_record do 
  indexes job_post_content
end