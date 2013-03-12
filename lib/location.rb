class Location

  CAPACITY = 20  
  attr_reader :bikes
  
  def initialize
    @bikes = []    
  end

  def <<(bike)
    raise "No room for Bikes at Garage" unless space_available?
    @bikes << bike
  end

  def release_bike(bike)
    raise "Bike in question is missing." unless @bikes.include?(bike)
    @bikes.delete bike
  end

  def count_bikes
    @bikes.count
  end

  def space_available?
    @bikes.count < self.class::CAPACITY
  end

end
