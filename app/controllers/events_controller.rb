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
	redirect_to event_path(@event.id)
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

# Creates a new Day object for each available date and adds it to the event
def addDates()
	dates = JSON.parse(params[:dates_array])
	for day in dates do 
		@event.days.push(Day.create(:event_id => @event.id, :cal_day => Date.strptime(day, "%m/%d/%Y")))
	end
end





end