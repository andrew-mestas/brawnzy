class MainController < ApplicationController
  def index
  	puts "geocoder#{Gym.near('Seattle, Washington')}"

  end
end
