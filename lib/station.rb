require './lib/location'

class Station < Location
  include DataMapper::Resource

  property :id, Serial
  #property
  #property #no of bikes

    CAPACITY = 20


  def working_bikes
    Bike.all.select { |bike| !bike.broken? }
  end

  def broken_bikes
    @bikes.select { |bike| bike.broken? }
  end

  

  # def working_bikes_count
  #   @bikes.count {|bike| !bike.broken? }
  # end

  # def broken_bikes_count
  #   @bikes.count { |bike| bike.broken? }
  # end

  private

  def space_available?
    @bikes.count < CAPACITY
  end
end
