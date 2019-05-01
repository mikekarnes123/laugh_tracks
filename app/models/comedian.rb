class Comedian < ApplicationRecord
  has_many :specials

  def number_of_specials
    specials.count
  end
end
