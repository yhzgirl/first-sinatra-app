class Bike
  include DataMapper::Resource

  property :id, Serial
  property :broken, Boolean, :default => false

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