class Bike
  include DataMapper::Resource

  property :id, Serial
  property :broken, Boolean

  def initialize
    @broken = false
  end

  def broken?
    @broken    
  end

  def break!
    @broken = true
    self   
  end

  def fix!
    @broken = false
    self
  end
end