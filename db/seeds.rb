# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Project.create!([
  {
    name: "Project A",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the...",
    target_pledge_amount: 500000.00,
    website: "www.projectA.org",
    pledging_ends_on: "2015-11-02"
  },
  {
    name: "Project B",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the...",
    target_pledge_amount: 10000.00,
    website: "www.projectB.org",
    pledging_ends_on: "2016-08-02"
  },
  {
    name: "Project C",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the...",
    target_pledge_amount: 4000.00,
    website: "www.projectC.org",
    pledging_ends_on: "2015-04-02"
  }
])
