# encoding: UTF-8

class Publication < ActiveRecord::Base
  has_many :addresses
  has_many :departments, through: :addresses
  has_many :people, through: :addresses
  has_many :publication_data
  has_many :publication_meta_data
  belongs_to :publication_type
  belongs_to :language

end
