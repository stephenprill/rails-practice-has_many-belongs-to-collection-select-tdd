require 'rails_helper'

feature 'Toys' do
  scenario 'User can see list of cats and toys on the toys index page' do
    cat = create_cat
    toy = create_toy(cat)
    visit root_path
    click_on 'Toys'
    expect(page).to have_content(toy.name)
    expect(page).to have_content(cat.name)
  end

  scenario 'User can create a new cats toy' do
    cat = create_cat
    visit toys_path
    click_on 'New Toy'
    fill_in 'Name', with: 'Cat Nip'
    select cat.name, from: 'toy[cat_id]'
    click_on 'Create Toy'
    expect(page).to have_content('Cat Nip')
    expect(page).to have_content(cat.name)
  end

  scenario 'Toy show page should list the cat that owns that toy (toys are not shared)' do
    cat = create_cat
    toy = create_toy(cat)
    visit toys_path
    click_on toy.name
    expect(page).to have_content(toy.name)
    expect(page).to have_content(cat.name)
  end
end
