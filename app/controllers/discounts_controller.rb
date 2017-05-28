class DiscountsController < ApplicationController

  def index
    @discounts = Discount.all
    @equators = ['equal', 'greater']
  end

  def new
    @discount = Discount.new
  end

  def create
    if allowed_parameters
       Discount.create(allowed_parameters)
      redirect_to discounts_path
    else
      redirect_to new_discount_path
    end
  end

  def show
    @discount = Discount.find(params[:id])
  end

  def update
    @discount = Discount.find(params[:id])
    @discount.update_attributes(allowed_parameters)
    redirect_to discounts_path
  end

  def destroy
    @discount = Discount.find(params[:id])
    @discount.destroy
    redirect_to discounts_path
  end
  

  private

  def allowed_parameters
    params.require(:discount).permit(:name, :threshold, :equator, :amount)
  end
  

end
