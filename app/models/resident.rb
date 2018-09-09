class Resident < ActiveRecord::Base
  has_many :sanctions
  belongs_to :manager
end
