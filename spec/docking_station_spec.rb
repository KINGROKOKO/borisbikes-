# In spec/docking_station_spec.rb
require 'docking_station'

describe DockingStation do

  it 'releases working bikes' do
    bike=Bike.new
    subject.dock(bike)
    subject.release_bike
    expect(bike).to be_working
  end

  it 'docks bike' do
    bike=Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'bike available after dock?' do
    bike=Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  it 'bike available before dock?' do
    bike=Bike.new
    expect{subject.release_bike}.to raise_error 'no bikes'
  end

  it 'dock full!' do
    bike=Bike.new
    DockingStation::DEFAULT_CAPACITY.times{subject.dock(bike)}
    expect{subject.dock(bike)}.to raise_error 'full'
  end
end
