class Comedian < ApplicationRecord
  
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :thumbnail
  validates_presence_of :city
  has_many :specials

  def number_of_specials
    specials.count
  end
end
