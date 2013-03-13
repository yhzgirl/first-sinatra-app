class Person
  include DataMapper::Resource
  
  property :id, Serial
  property :has_bike, Boolean

  def initialize
    @bike = nil
  end

  def take_bike(bike)
    @bike = bike
  end

  def has_bike?
    @bike != nil
  end

  def return_bike(bike=nil)
    @bike = nil
    self
  end
end