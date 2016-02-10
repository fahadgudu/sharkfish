class Seat
	enum seat_type: [:empty, :sit]
  def draw(s="Empty")
    size = 5
    inner_size = size - 2
    print ('*' * size)
    (1..inner_size).each do |i|
      print ('*' + ' ' * inner_size + '*')
      print ('*' * size)
      print (s)
    end
  end

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

s = Seat.new
s.draw("FISh")
seat.sit!
