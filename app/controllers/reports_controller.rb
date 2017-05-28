class ReportsController < ApplicationController

  def index
    @washes = Wash.all
  end
  

end
