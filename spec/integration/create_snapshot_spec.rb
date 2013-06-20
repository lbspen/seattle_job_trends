require 'spec_helper'

feature 'Creating Snapshot -' do

  include_context 'stub nokogiri'

  job_post_content = Nokogiri::XML("<root><e>xml content</e></root>")

  before(:each) { stub_nokogiri(:XML, job_post_content) }

  scenario "Test stub" do
    ret = Nokogiri::XML()
    ret.should == job_post_content
  end

  scenario "Happy Path" do
    location = "Downtown"
    visit '/'
    click_link 'New Snapshot'
    fill_in 'Location', :with => location
    click_button 'Create Snapshot'
    page.status_code.should equal 200
    page.should have_content("Snapshot retrieved.")
    snapshot = Snapshot.all[0]
    page.current_path.should == snapshot_path(snapshot)
    page.should have_content(job_post_content.css("e").inner_text)
  end

end
