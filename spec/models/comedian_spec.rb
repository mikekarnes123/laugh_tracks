require 'rails_helper'

RSpec.describe Comedian, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :city}
    it {should validate_presence_of :thumbnail}
  end

  describe 'Instance Methods' do

    describe '#number_of_specials' do
      it 'should return the number of specials' do
        jerry = Comedian.create(name: "Jerry", age: 50, city: "no idea", thumbnail: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Jerry_Seinfeld_2016_-_2.jpg/220px-Jerry_Seinfeld_2016_-_2.jpg")
        jerry.specials.create(title: "idk", run_time: 100)
        jerry.specials.create(title: "other special", run_time: 50)

        expect(jerry.number_of_specials).to equal(2)
      end
    end
  end

end
