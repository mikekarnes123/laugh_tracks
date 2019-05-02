class Comedian < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :thumbnail
  validates_presence_of :city
  has_many :specials

  after_initialize :set_defaults

  def set_defaults
    if thumbnail == ""
      self.thumbnail = "https://cdn140.picsart.com/262128021005212.png?r1024x1024"
    end
  end

  def self.same_age?
    pluck(:age).uniq.count == 1
  end

  def number_of_specials
    specials.count
  end
end
