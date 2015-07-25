# Calling this method without any parameters simply returns the hash of attribute names and values.
# The default hash parameters allows any of the attribute values to be overridden
# When you call project_attributes with a hash of attributes, that hash will get merged with the
# existing attributes hash, i.e. to change the total_gross attribute value:
# project_attributes(target_pledge_amount: 6000000.00)
#

def project_attributes(overrides = {})
  {
    name: "Start-Up Project",
    description: "A description of a start-up project",
    target_pledge_amount: 100.00,
    pledging_ends_on: 1.day.from_now,
    website: "http://project-a.com"
  }.merge(overrides)
end
