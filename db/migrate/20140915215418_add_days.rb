class AddDays < ActiveRecord::Migration
  def change
  	create_table :days do |t|
  		t.integer :event_id
  		t.date :cal_day
  	end
  end
end