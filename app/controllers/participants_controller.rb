class ParticipantsController < ApplicationController 

def index()
	@title = "Schedulr";
end

def new()
	@title = "Schedulr";
end


def create()
	@participant = Participant.create(:name => params[:participant][:name])
	event = Event.find(params[:event_id])
	if(@participant.save)
		availability = Array.new()
		availability =  JSON.parse(params[:availability])
	# raise availability.inspect
		for day in availability.keys
			parsedDay = Date.strptime(day, "%m/%d/%Y")
			for time in availability[day]	
				timeblock = Timeblock.create(:time_id => time, :cal_day => parsedDay)
				@participant.timeblocks.push(timeblock)
			end
		end
		event.participants.push(@participant)
	else 
		flash.notice = "Please enter a name!"
	end
	redirect_to event_path(event.id.to_s)

end

# def createTimeBlocks(availability = {})

# end

end