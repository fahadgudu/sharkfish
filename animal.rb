class Seat
	enum seat_type: [:empty, :sit]
end

class Table
	def initilize(seats_count = 1)
		@seats = Seat.new(seats_count)
	end
end

class Animal
  def shark_fish_sync_init
  	
  end
  def shark_fish_sync_cleanup
  	
  end
end  
  
class Fish < Animal  
  def fish_before_eat
  	
  end
  def fish_after_eat
  	
  end
end

class Shark < Animal  
  def shark_before_eat
  	
  end
  def shark_after_eat
  	
  end
end