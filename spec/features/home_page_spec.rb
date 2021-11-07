require 'rails_helper'

RSpec.feature "Visiting the home page", type: :feature do
  scenario "The visitor should see projects" do
    visit root_path                         #visits root path (home page)
    expect(page).to have_text("Projects")   #checking to see if projects are listed on the home page
  end
end
