class Person < ActiveRecord::Base
  has_many :addresses
  has_many :publications, through: :addresses
  has_many :departments, through: :addresses
end
