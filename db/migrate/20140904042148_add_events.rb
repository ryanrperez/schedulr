class AddEvents < ActiveRecord::Migration
  def change
  	create_table :events do |e|
  		e.string :event_name
  		e.time :start_time
  		e.time :end_time
  	end
  end
end
