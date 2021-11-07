require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  #tests to see if we can create a new project 
  context "Create new project" do
    before(:each) do
      visit new_project_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

    #check to see if a project was successfully created when we create a new project
    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end

    #checks to see if we don't add a description, we should get an error message "Description can't be blank"
    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project" do
    #if we update a project, before each scenario we visit the edit_project_path(project) URI)
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      visit edit_project_path(project)
    end

    #checks for successful update message
    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    #checks for "Description can't be blank" if description stripped from project
    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
    #check to see if we get a success message when we click "Destroy" button
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    scenario "remove project" do
      visit projects_path
      click_link "Destroy"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end
  end
end
