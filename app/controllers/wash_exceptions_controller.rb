class WashExceptionsController < ApplicationController

  def index
    @exceptions = WashException.all
  end

  def new
    @exception= WashException.new
  end

  def create
    if allowed_parameters
       WashException.create(allowed_parameters)
      redirect_to wash_exceptions_path
    else
      redirect_to new_wash_exception_path
    end
  end

  def show
    @exception = WashException.find(params[:id])
  end

  def update
    @exception = WashException.find(params[:id])
    @exception.update_attributes(allowed_parameters)
    redirect_to wash_exceptions_path
  end

  def destroy
    @exception = WashException.find(params[:id])
    @exception.destroy
    redirect_to wash_exceptions_path
  end
  

  private

  def allowed_parameters
    params.require(:wash_exception).permit(:name, :description)
  end

  
end

