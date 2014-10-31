class AddTimeblocks < ActiveRecord::Migration
  def change
  	create_table :timeblocks do |t|
  		t.integer :participant_id
  		t.integer :time_id
  		t.date :cal_day
  	end
  end
end
#time_id references method in controller to determine real-world time
