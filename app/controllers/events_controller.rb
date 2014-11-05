class EventsController < ApplicationController 

def index()
	@title = "Schedulr";
	@events = Event.find(:all)
end

def new()
	@title = "Schedulr";
	@event = Event.new
end


def create()
	@event = Event.create(:event_name => params[:event][:event_name],
		:start_time => params[:event][:start_time], :end_time => params[:event][:end_time])
	# for each date passed in, we'll make a new day and add it to the event.dates

	addDates()
	if(@event.save)
		# place holder code to know whether we have successfully saved the event. We'll need to do validation
		flash.notice = "woot you created a new event with event name " + @event.event_name
	else
		flash.notice = "failure"
	end

	# We'll redirect to whatever page shows the participant view c
	redirect_to event_path("new")
end

def show()
	# Currently checking off auto id --> we need to hash this
	if(!Event.exists?(params[:id]))
		flash.notice = "That is not a valid User ID"
 		redirect_to events_path
		
	else
		@event = Event.find(params[:id])
					@title = @event.event_name
 	end
 	@participant = Participant.new
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