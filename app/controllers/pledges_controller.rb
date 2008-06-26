class PledgesController < ApplicationController
  
  def index
    @pledges = Pledge.find(:all)
  end
  
  def new
  end
  
  def create
    Pledge.create(params[:pledge])
    flash[:notice] = 'Thank you for supporting the continuted development of nProv. Upon collecting your pledge, your request will be considered.'
    redirect_to :action => :index
  end
  
end
