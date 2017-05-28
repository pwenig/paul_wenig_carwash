class PackagesController < ApplicationController

  def index
    @packages = Package.all
  end

  def new
    @package = Package.new
  end

  def create
    if allowed_parameters
       Package.create(allowed_parameters)
      redirect_to packages_path
    else
      redirect_to new_package_path
    end
  end

  def show
    @package = Package.find(params[:id])
  end

  def update
    @package = Package.find(params[:id])
    @package.update_attributes(allowed_parameters)
    redirect_to packages_path
  end

  def destroy
    @package = Package.find(params[:id])
    @package.destroy
    redirect_to packages_path
  end
  

  private

  def allowed_parameters
    params.require(:package).permit(:name, :description, :price)
  end
  

end

