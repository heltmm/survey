class Question < ActiveRecord::Base
  belongs_to(:survey)
  has_many(:answers)
  validates(:ask, :presence => true)
end
