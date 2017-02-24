class Test

  attr_accessor :make, :model, :year, :speed

  def initialize (make,model,year)
    @make = make
    @model = model
    @year = year
    @speed = 0
  end
  def accelerate
    @speed += 10
  end
  def brake
    @speed -= 7
  end




end
