
describe 'Editing a project' do

  it "updates the project and shows the project' s update details" do
    project = Project.create(project_attributes)

    visit project_url(project)

    click_link 'Edit'

    expect(current_path).to eq(edit_project_path(project))

    expect(find_field('Name').value).to eq(project.name)
    expect(find_field('Description').value).to eq(project.description)
    expect(find_field('Target pledge amount').value).to eq("100")
    expect(find_field('Website').value).to eq(project.website)
  end
end