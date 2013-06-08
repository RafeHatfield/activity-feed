# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


# Seed activity types currently used in suite101.
# Note that the 'buzz' thumbnail name is different than the activity name.
ActivityType.create!([
  {:name => 'comment', :thumbnail_name => 'comment'},
  {:name => 'new_writer', :thumbnail_name => 'new_writer'},
  {:name => 'published_article', :thumbnail_name => 'published_article'},
  {:name => 'editors_choice', :thumbnail_name => 'editors_choice'},
  {:name => 'facebook', :thumbnail_name => 'facebook'},
  {:name => 'twitter', :thumbnail_name => 'twitter'},
  {:name => 'stumbleupon', :thumbnail_name => 'stumbleupon'},
  {:name => 'buzz', :thumbnail_name => 'yahoobuzz'},
  ]);