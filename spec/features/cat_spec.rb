require 'rails_helper'

#Each Cat show page should list the toys that cat owns.

feature 'Cats have toys' do
  scenario "User can view a cat's toy on the show page" do

      cat = create_cat
      toy = create_toy(cat)
      visit '/'
      click_on "Cats"
      click_on cat.name
      expect(page).to have_content toy.name
    end
end
