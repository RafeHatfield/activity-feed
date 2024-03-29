class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string :message
      t.string :permalink
      t.integer :activity_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
