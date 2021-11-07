require "rails_helper"

RSpec.describe Project, type: :model do
  context "validations tests" do
    #ensures title is present by creating a project with no title, should evaluate to not valid
    it "ensures the title is present" do
      project = Project.new(description: "Content of the description")
      expect(project.valid?).to eq(false)
    end

    #ensures description is present by creating a project with no description, should evaluate to not valid
    it "ensures the description is presend" do
        project = Project.new(title: "Test title")
        expect(project.valid?).to eq(false)
    end

    #tests to make sure we can save a project if it has both a title and description
    it "should be able to save project" do
      project = Project.new(title: "Title", description: "Some description content goes here")
      expect(project.save).to eq(true)
    end
  end

  #ensures if we create 3 proejcts, we see 3 projects
  context "scopes tests" do
    let(:params) { { title: "Title", description: "some description" } }
    before(:each) do
      Project.create(params)
      Project.create(params)
      Project.create(params)
    end

    it "should return all projects" do
      expect(Project.count).to eq(3)
    end
  end
end
