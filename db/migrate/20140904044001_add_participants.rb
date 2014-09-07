class AddParticipants < ActiveRecord::Migration
  def change
  	create_table :participants do |t|
  		t.integer :event_id
  		t.string :name
  	end
  end
end
