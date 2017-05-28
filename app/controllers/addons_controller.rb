class AddonsController < ApplicationController

   def index
    @addons = Addon.all
   end

  def new
    @addon = Addon.new
  end

  def create
    if allowed_parameters
       Addon.create(allowed_parameters)
      redirect_to addons_path
    else
      redirect_to new_addon_path
    end
  end

  def show
    @addon = Addon.find(params[:id])
  end

  def update
    @addon = Addon.find(params[:id])
    @addon.update_attributes(allowed_parameters)
    redirect_to addons_path
  end

  def destroy
    @addon = Addon.find(params[:id])
    @addon.destroy
    redirect_to addons_path
  end
  

  private

  def allowed_parameters
    params.require(:addon).permit(:name, :description, :price)
  end

end
