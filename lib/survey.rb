class Survey < ActiveRecord::Base
  has_many(:questions)
  before_save(:capitalize_name)
  validates(:description, :presence => true)
  validates(:name, :presence => true)
  scope(:not_done, -> do
  where({:done => false})
  end)

private
  def capitalize_name
    self.name = (name.split(" ").map {|word| word.capitalize}).join(' ')
  end
end
