class Survey < ActiveRecord::Base
  has_many(:questions)

  before_save(:capitalize_name)


private
  def capitalize_name
    self.name = (name.split(" ").map {|word| word.capitlize}).join(' ')
  end
end
