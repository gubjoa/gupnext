class Address < ActiveRecord::Base
  belongs_to :department
  belongs_to :person
  belongs_to :publication
end
