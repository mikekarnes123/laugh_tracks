require 'rails_helper'

RSpec.describe 'comedian index page', type: :feature do
  before :each do
    @jerry = Comedian.create(name: "Jerry", age: 50, city: "no idea", thumbnail: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Jerry_Seinfeld_2016_-_2.jpg/220px-Jerry_Seinfeld_2016_-_2.jpg")
    @bob = Comedian.create(name: "Bob", age: 21, city: "some city", thumbnail: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Jerry_Seinfeld_2016_-_2.jpg/220px-Jerry_Seinfeld_2016_-_2.jpg")
    @rob = Comedian.create(name: "Rob", age: 30, city: "different city", thumbnail: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Jerry_Seinfeld_2016_-_2.jpg/220px-Jerry_Seinfeld_2016_-_2.jpg")
  end
  it 'has comedian info' do

    visit comedians_path

    expect(page).to have_content(@jerry.name)
    expect(page).to have_content(@jerry.age)
    expect(page).to have_content(@jerry.city)
    expect(page).to have_content(@bob.name)
    expect(page).to have_content(@bob.age)
    expect(page).to have_content(@bob.city)
    expect(page).to have_content(@rob.name)
    expect(page).to have_content(@rob.age)
    expect(page).to have_content(@rob.city)
  end

  it 'has special title and run time for each comedian' do
    
    @jerry.specials.create(title: "idk", run_time: 100)
    @jerry.specials.create(title: "other special", run_time: 50)

    visit comedians_path

    within("##{@jerry.id}") do
      expect(page).to have_content('idk')
      expect(page).to have_content(100)
    end
  end


  it 'has thumbnail images for comedians' do

    visit comedians_path

    within("##{@jerry.id}") do
      expect(page).to have_xpath("//img[@src='https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Jerry_Seinfeld_2016_-_2.jpg/220px-Jerry_Seinfeld_2016_-_2.jpg']")
    end
  end

  it 'has thumbnail images for comedians' do

     visit '/comedians?age=50'

     expect(page).to have_content("Jerry")
     expect(page).to_not have_content("Bob")
     expect(page).to_not have_content("Rob")
  end

  it 'should have number of specials for each comedian' do

    @jerry.specials.create(title: "idk", run_time: 100)
    @jerry.specials.create(title: "other special", run_time: 50)
    @bob.specials.create(title: "extra special", run_time: 90)

    visit comedians_path

    within("##{@jerry.id}") do
      number_of_specials = @jerry.specials.count
      expect(page).to have_content("Number of Specials: #{number_of_specials}")
    end
    within("##{@bob.id}") do
      number_of_specials = @bob.specials.count
      expect(page).to have_content("Number of Specials: #{number_of_specials}")
    end
  end
end
