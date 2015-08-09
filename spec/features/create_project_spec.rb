describe 'Creating a new project' do

  it "should save the project and show the project's details" do
    setup_new_project

    click_button 'Create Project'

    expect(current_path).to eq(project_path(Project.last))

    expect(page).to have_text('New Project Name')
    expect(page).to have_text('New Project Description')
    expect(page).to have_text('$150.00')
    expect(page).to have_text('www.website.com')
  end

  it "does not save the project and goes to the listing page when 'Cancel' is pressed" do
    setup_new_project

    click_link "Cancel"

    expect(current_path).to eq(projects_path)

    expect(page).to_not have_text('New Project Name')
    expect(page).to_not have_text('New Project Description')
    expect(page).to_not have_text('$150.00')
    expect(page).to_not have_text('www.website.com')
  end

  it "displays the footer partial" do
    setup_new_project

    expect(page).to have_text("The Pragmatic Studio")
  end
end

private
def setup_new_project
  visit projects_url

  click_link 'Add New Project'

  expect(current_path).to eq(new_project_path)

  fill_in "Name", with: "New Project Name"
  fill_in "Description", with: "New Project Description"
  fill_in "Target pledge amount", with: "150.00"
  select (Time.now.year + 1).to_s, :from => "project_pledging_ends_on_1i"
  fill_in "Website", with: "www.website.com"
  fill_in "Team members", with: "The team members"
  fill_in "Image file name", with: "project.png"
end


