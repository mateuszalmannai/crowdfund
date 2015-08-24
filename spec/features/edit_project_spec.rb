
describe 'Editing a project' do

  it "updates the project and shows the project's update details" do
    project = setup_project

    click_button 'Update Project'

    expect(current_path).to eq(project_path(project))

    expect(page).to have_text('Updated Project Name')
    expect(page).to have_text('Project successfully updated!')
  end

  it "does not update the project and goes to the listings page when 'Cancel' is pressed" do
    project = setup_project

    click_link 'Cancel'

    expect(current_path).to eq(projects_path)

    expect(page).to_not have_text('Updated Project Name')
  end

  it "does not update the project if it's invalid" do
    project = Project.create(project_attributes)

    visit edit_project_url(project)

    fill_in 'Name', with: " "

    click_button 'Update Project'

    expect(page).to have_text('error')
  end

  it "displays the footer partial" do
    setup_new_project

    expect(page).to have_text("The Pragmatic Studio")
  end
end

private

def setup_project
  project = Project.create(project_attributes)

  visit project_url(project)

  click_link 'Edit'

  expect(current_path).to eq(edit_project_path(project))

  expect(find_field('Name').value).to eq(project.name)
  expect(find_field('Description').value).to eq(project.description)
  expect(find_field('Target pledge amount').value).to eq("100")
  expect(find_field('Website').value).to eq(project.website)

  fill_in 'Name', with: "Updated Project Name"
  project
end

