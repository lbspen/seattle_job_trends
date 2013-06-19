require 'spec_helper'

feature "Viewing Snapshots -" do 
  
  location1 = "Downtown"
  location2 = "Bellevue"
  let!(:snapshot1) { Factory.create(:snapshot, :location => location1) }
  let!(:snapshot2) { Factory.create(:snapshot, :location => location2) }
  
  scenario "All snapshots" do 
    visit "/"
    page.status_code.should equal 200
    page.should have_content(location1)
    page.should have_content(snapshot1.created_time)
    page.should have_content(location2)
    page.should have_content(snapshot2.created_time)
  end

  scenario "One snapshot" do
    visit "/"
    click_link location1
    page.status_code.should equal 200
    page.should have_content(location1)
    page.should have_content(snapshot1.created_time)
  end
end