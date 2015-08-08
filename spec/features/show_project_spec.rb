describe "Viewing an individual project" do
  it "shows the project's details" do
    project = Project.create(project_attributes(target_pledge_amount: 6000000.00))

    visit project_url(project)

    expect(page).to have_text(project.name)
    expect(page).to have_text(project.description)
    expect(page).to have_text("$6,000,000.00")
    expect(page).to have_text(project.website)
  end

  it "shows the number of days remaining if the pledging end date is in the future" do
    project = Project.create(project_attributes(pledging_ends_on: 1.day.from_now))

    visit project_url(project)

    expect(page).to have_text("1 day remaining")
  end

  it "shows 'All Done!' if the pledging end date is in the past" do
    project = Project.create(project_attributes(pledging_ends_on: 1.day.ago))

    visit project_url(project)

    expect(page).to have_text("All Done!")
  end

  it "displays the footer partial" do
    project = Project.create(project_attributes)

    visit project_url(project)

    expect(page).to have_text("The Pragmatic Studio")
  end
end
