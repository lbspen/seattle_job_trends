class Snapshot < ActiveRecord::Base
  attr_accessible :location

  def created_time
    self.created_at.strftime("%l:%M %P %m/%d/%y") 
  end
end
