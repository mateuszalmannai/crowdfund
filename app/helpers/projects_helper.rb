module ProjectsHelper
  def format_pledging_ends_on(project)
    if project.pledging_expired?
      #content_tag(:strong, time_ago_in_words(project.pledging_ends_on) + ' ago.')
      content_tag(:strong, 'All Done!')
    else
      distance_of_time_in_words(Date.today, project.pledging_ends_on) + " remaining"
    end
  end
end
