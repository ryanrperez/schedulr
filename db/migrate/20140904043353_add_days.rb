class AddDays < ActiveRecord::Migration
  def change
  	create_table :days do |t|
  		t.integer :event_id
  		t.date :date
  	end
  end
end
