class FarmsController < ApplicationController
  
  def index
    @farms = Farm.find(:all)
  end
  
  def new
    @farm = Farm.new(params[:farm])
  end
  
end
