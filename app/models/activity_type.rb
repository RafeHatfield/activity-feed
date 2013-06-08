# == Schema Information
# Schema version: 20110120184825
#
# Table name: activity_types
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  thumbnail_name :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class ActivityType < ActiveRecord::Base
  has_many :activities
  validates_presence_of :name, :thumbnail_name
  
  def thumbnail_url
    "http://graphics.suite101.com/activity_feed_icon_#{self.thumbnail_name}_32.png"
  end
end
