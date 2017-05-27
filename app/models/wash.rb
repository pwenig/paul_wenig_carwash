class Wash < ApplicationRecord

  belongs_to :package
  belongs_to :addon, optional: true
  belongs_to :customer

end
