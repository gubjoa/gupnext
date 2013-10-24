class Department < ActiveRecord::Base
  has_many :addresses
  has_many :publications, through: :addresses
  has_many :people, through: :addresses
end
