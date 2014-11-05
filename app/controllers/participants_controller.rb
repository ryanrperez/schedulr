class ParticipantsController < ApplicationController 

def index()
	@title = "Schedulr";
end

def new()
	@title = "Schedulr";
end


def create()
	@participant = Participant.create(:name => params[:participant][:name])
	event = Event.find(1)
	event.participants.push(@participant)
	redirect_to event_path("/"+event.id.to_s)

	# createTimeBlocks(params[:participant][:availability]);

#Making timeblocks
	availability = {"11/03/2014"=> [1,2,3], "11/04/2014"=> [2,3,4]}
	for day in availability.keys
		parsedDay = Date.strptime(day, "%m/%d/%Y")
		for time in availability[day]	
			timeblock = Timeblock.create(:time_id => time, :cal_day => parsedDay)
			@participant.timeblocks.push(timeblock)
		end
	end

end

# def createTimeBlocks(availability = {})

# end

end