# == Schema Information
# Schema version: 20110120184825
#
# Table name: activities
#
#  id               :integer         not null, primary key
#  message          :string(255)
#  permalink        :string(255)
#  activity_type_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Activity < ActiveRecord::Base
  belongs_to :activity_type
  validates_presence_of :message, :permalink, :activity_type_id
  validates_numericality_of :activity_type_id, :only_integer => true, :greater_than => 0, :message => "does not exist."
  
  @@NUMBER_OF_MOST_RECENT = 5
  
  # Activity uses the id field rather than created_at to determine time
  # ordering since this avoids conversion of times from javascript, and
  # also avoids possible conflicts.
  
  # Return a maximum of @@MAX_TO_FEED of the most recent activities.
  def self.get_most_recent
    order("id DESC").limit(@@NUMBER_OF_MOST_RECENT).includes(:activity_type)
  end
  
  # Return a maximum of @@MAX_TO_FEED of the most recent activities which
  # are more recent than the activity with id "id".
  def self.get_more_recent_than(id)
    where("id > ?", id).order("id DESC").limit(@@NUMBER_OF_MOST_RECENT)
  end
  
end
