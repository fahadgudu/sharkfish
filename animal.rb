class Seat
  def initialize
    @seat_type = "empty"
    @animal_type = "none"
    @lock = Mutex.new
  end
  def seat_type=(seat_type)
    @seat_type = seat_type
  end
  def animal_type=(animal_type)
    @animal_type = animal_type
  end
  def seat_type
    @seat_type
  end
  def animal_type
    @animal_type
  end
  def available?
    @lock.locked?
  end
  def occupy!(type)
    return if seats_available.empty?
    @lock.synchronize {
      puts "Seat occupied by #{type}"
      @animal_type = type
      @seat_type = "full"
      eat()
      @animal_type = "none"
      @seat_type = "empty"
    }
  end
  def eat
    sleep(30)
  end
end

class Table
  def initialize(seats_count = 1)
		@seats = []
	end
  def create_seats(seats_count = 1)
    seats_count.times do
      @seats << Seat.new
    end
  end
  def seats
    @seats
  end
  def seats_available
    @seats.collect do |seat|
      seat if seat.available?
    end.compact
  end
  def no_shark
    !@seats.collect(&:animal_type).include?("shark")
  end
  def no_fish
    !@seats.collect(&:animal_type).include?("fish")
  end
  def fish_count
    @seats.collect(&:animal_type).count("fish")
  end
end

class Animal
  def shark_fish_sync_init

  end
  def shark_fish_sync_cleanup

  end
end

class Fish < Animal
  def fish_before_eat(table)
    if table.seats_available and table.no_shark
      #eat weed
    else
      #wait
    end
  end
  def fish_after_eat

  end
end

class Shark < Animal
  def shark_before_eat
    if table.seats_available and table.no_fish
      #eat weed
    elsif table.fish_count == 1
      #eat fish
    elsif table.fish_count > 1
      #wait
    end
  end
  def shark_after_eat

  end
end

class Syncproblem
  def initialize(seats, sharks, fishes, iter)
    @table = Table.new
    @table.create_seats(seats)
    @sharks = []
    sharks.times do
      @sharks << Shark.new
    end
    @fishes = []
    fishes.times do
      @fishes << Fish.new
    end
  end
  def table
    @table
  end
  def sharks
    @sharks
  end
  def fishes
    @fishes
  end
end
# s = Seat.new
# s.draw("FISh")
# seat.sit!
