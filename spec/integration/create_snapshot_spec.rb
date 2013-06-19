require 'spec_helper'

feature 'Creating Snapshot -' do

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
  end

end
