require './lib/station'

class Bike
  include DataMapper::Resource

  property :id, Serial
  property :broken, Boolean, :default => false
  # property :station_id, Integer, :default => 135

  belongs_to :station

  def broken?
    broken    
  end

  def break!
    self.broken = true 
    save
    self
  end

  def fix!
    self.broken = false
    save
    self
  end
end