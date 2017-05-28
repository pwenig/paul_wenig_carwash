class WashesController < ApplicationController

  def index
    @wash = Wash.new
  end

  def new
    @wash = Wash.new
    @customer = Customer.new
    @customer.washes.build
    @customer.license = params['license']
    @packages = Package.all
    @addons = Addon.all
    @wash_exceptions = WashException.all
    @current_customer = Customer.find_by(:license => @customer.license)
    if @current_customer.present?
      @customer.first_name = @current_customer.first_name
      @customer.last_name = @current_customer.last_name
    end
    
  end

  def create
    # Check for exceptions
    if params['customer']['washes']['wash_exception_id'].present?
      flash[:danger] = "Exception! Car cannot be washed."
      redirect_to washes_path

    else
      customer = Customer.find_by(:license => params['customer']['license'])
      if customer.nil?
        customer = Customer.create(
          first_name: params['customer']['first_name'],
          last_name: params['customer']['last_name'],
          license: params['customer']['license'])
      end
      # Check for eligible discounts.
      if customer.washes.length > 0
        discount = Wash.discount(customer.washes.length)
      else
        discount = Wash.discount(0)
      end
      # Calculate Total
      if discount != 0
        total = Wash.calculate_total(params['customer']['washes']) * discount.to_f
      else
        total = Wash.calculate_total(params['customer']['washes'])
      end
      total = helper.number_to_currency(total)
      # Create the Wash
      wash = Wash.create!(
        amount: total,
        package_id: params['customer']['washes']['package_id'].to_i,
        addon_id: params['customer']['washes']['addon_id'].to_i,
        customer_id: customer.id)
      customer.update_attribute(:wash_id, wash.id)
      flash[:success] = "Sale for #{total} Complete"
      redirect_to washes_path
    end

  end

  def lookup
    if params['wash']['license'].present?
      @license = params['wash']['license']
      if Wash.is_stolen(@license)
        redirect_to washes_path
        flash[:danger] = 'Car is stolen!'
      else
        redirect_to new_wash_path(:license => @license)

      end
    else
      redirect_to washes_path
      flash[:warning] = "Enter License No."
    end
  end

  private

  def helper
    @helper ||= Class.new do
      include ActionView::Helpers::NumberHelper
    end.new
  end

end

