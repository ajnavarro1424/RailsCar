class CarController < ApplicationController
  def homepage
  end

  def simulate

    if(params.has_key?(:make) && !params[:make].strip.empty? &&
       params.has_key?(:model) && !params[:model].strip.empty? &&
       params.has_key?(:year) && !params[:year].strip.empty?)
       session[:car] = Test.new(params[:make],params[:model],params[:year]).to_yaml
       session[:color] = params[:color]
       redirect_to '/status'

    else
      redirect_to '/', alert: "Your simulation could not be made! Please try again."
    end
  end

  def status
    Test
    if session.has_key?(:car)
      @color = session[:color]
      @car = YAML.load(session[:car])
    else
     redirect_to '/'
    end
  end

  def accelerate
    Test
    @car = YAML.load(session[:car])
    if @car.parking_brake == "Off"
      @car.accelerate
    end
    session[:car] = @car.to_yaml
    redirect_to "/status"
  end

  def brake
    Test
    @car = YAML.load(session[:car])
    @car.brake
    session[:car] = @car.to_yaml
    redirect_to "/status"
  end

  def toggleLights
    Test
    @car = YAML.load(session[:car])
    @car.toggleLights
    session[:car] = @car.to_yaml
    redirect_to "/status"
  end

  def toggle_brake
    Test
    @car = YAML.load(session[:car])
    if !params[:brake].nil? && @car.parking_brake != params[:brake] && @car.speed == 0
      @car.toggle_brake
    end
    session[:car] = @car.to_yaml
    redirect_to "/status"

  end

  def newcar

    redirect_to '/'
  end
end
