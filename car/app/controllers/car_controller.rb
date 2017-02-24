class CarController < ApplicationController
  def homepage
  end

  def simulate

    if(params.has_key?(:make) && !params[:make].strip.empty? &&
       params.has_key?(:model) && !params[:model].strip.empty? &&
       params.has_key?(:year) && !params[:year].strip.empty?)
       session[:car] = Test.new(params[:make],params[:model],params[:year]).to_yaml
       redirect_to '/status'

    else
      redirect_to '/', alert: "Your simulation could not be made! Please try again."
    end
  end

  def status
    Test
    @car = YAML.load(session[:car])


  end

  def accelerate
    Test
    @car = YAML.load(session[:car])
    @car.accelerate
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
  def newcar
    
    redirect_to '/'
  end
end
