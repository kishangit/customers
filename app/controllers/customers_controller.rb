class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end
  
  def import
    HardWorker.perform_async(File.read(params[:attachment][:file]))
  end

end