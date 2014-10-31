class EventsController < ApplicationController 

def index()
	@events = Event.find(:all)
end

def new()
	@event = Event.new
end


def create()
	@event = Event.create(:event_name => params[:event][:event_name],
		:start_time => params[:event][:start_time], :end_time => params[:event][:end_time])
	# for each date passed in, we'll make a new day and add it to the event.dates

	addDates()
	if(@event.save)
		# place holder code to know whether we have successfully saved the event. We'll need to to validation
		flash.notice = "woot you created a new event with event name " + @event.event_name
	else
		flash.notice = "failure"
	end

	# We'll redirect to whatever page shows the participant view c
	redirect_to event_path("new")
end

def addDates()
	dates = params[:dates_array]
	start_index = 0;
	while true
		last_day = false;
		end_index = dates.index(",")
		if(end_index==nil) then
			end_index = dates.length
			last_day = true;
		end
		day_to_parse = dates[start_index..end_index-1]
		puts day_to_parse
		day = Day.create(:event_id => @event.id, :cal_day => Date.strptime(day_to_parse, "%m/%d/%Y"))
		dates = dates[end_index + 1 .. dates.length]
		if(last_day) then
			break
		end
		@event.days.push(day)

	end
end



end