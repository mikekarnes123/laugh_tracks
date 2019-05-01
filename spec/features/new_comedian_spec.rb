require 'rails_helper'

RSpec.describe 'new comedian workflow', type: :feature do
  it 'creates new comedian from form' do

    visit new_comedian_path

    fill_in "Name", with: "a name"
    fill_in "City", with: "a city"
    fill_in "Age", with: 48
    fill_in "Thumbnail", with: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Jerry_Seinfeld_2016_-_2.jpg/220px-Jerry_Seinfeld_2016_-_2.jpg"
    click_on "Submit"

    expect(current_path).to eq(comedians_path)
    expect(page).to have_content("a name")

  end

end
