require_relative 'bike_class'



class DockingStation
attr_reader :bikes

DEFAULT_CAPACITY=20

def initialize
  @bikes=[]
end

def release_bike
  fail 'no bikes' if empty?
end

def dock(bike)
  fail 'full' if full?
  @bikes<<bike
end

private

def full?
  return true if @bikes.count>=DEFAULT_CAPACITY
  false
end

def empty?
  return false if @bikes.count > 0
  true
end

  #def bike
  #  @bike
  #end
end
