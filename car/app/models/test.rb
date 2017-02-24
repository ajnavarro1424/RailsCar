class Test

  attr_accessor :make, :model, :year, :speed, :lights, :parking_brake

  def initialize (make,model,year)
    @make = make
    @model = model
    @year = year
    @speed = 0
    @lights = "Off"
    @parking_brake = "Off"
  end

  def accelerate
    @speed += 10
  end

  def brake
    @speed -= 7
    if @speed < 0
      @speed = 0
    end
  end

  def toggleLights
    @lights == "Off" ? @lights = "On" : @lights = "Off"
  end

  def toggle_brake
    @parking_brake == "Off" ? @parking_brake = "On" : @parking_brake = "Off"
  end

end
