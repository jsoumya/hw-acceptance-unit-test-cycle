Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    # hint: look at movies_controller#create for a hint toward the one-line solution.

	  Movie.create!(movie)
  end
end

Then /the director of "(.*)" should be "(.*)"/ do |movie, director|
  step %Q{I should see "#{movie}"}
  step %Q{I should see "#{director}"}
end

Given /I have added "(.*)" with rating "(.*)"/ do |title, rating|
  steps %Q{
      Given I am on Create New Movie page
      When I fill in "Title" with "#{movie}"
      And I select "#{rating}" from "Rating"
      And I press "Save Changes"
    }
end



