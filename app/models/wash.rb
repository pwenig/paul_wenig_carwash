class Wash < ApplicationRecord

  belongs_to :package
  belongs_to :addon, optional: true
  belongs_to :wash_exception, optional: true
  belongs_to :customer


  def self.is_stolen(license)
    StolenCar.all.each do |stolen|
      if stolen.license == license
        return true
      else
        return false
      end
    end

  end

  def self.discount(number_of_washes)
    Discount.all.each do |discount|
      if discount.equator == 'equal' && discount.threshold == number_of_washes + 1
        return discount.amount
      elsif discount.equator == 'greater' && (number_of_washes +1) > discount.threshold
        return discount.amount
      else
        return 0
      end
    end

  end
  

  def self.calculate_total(washes)
    if washes['package_id'].present?
     package = Package.find(washes['package_id'])
     total = package.price
    end
    if washes['addon_id'].present?
      addon = Addon.find(washes['addon_id'])
      total = total + addon.price
    end
    return total

  end

end
