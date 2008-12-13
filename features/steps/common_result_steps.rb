Then /^I should see "(.*)"$/ do |text|
  response.body.should =~ /#{text}/m
end

Then /^I should not see "(.*)"$/ do |text|
  response.body.should_not =~ /#{text}/m
end

Then /^I should see an? (\w+) message$/ do |message_type|
  response.should have_xpath("//*[@class='#{message_type}']")
end

Then /^the (.*) ?request should fail/ do |_|
  response.should_not be_successful
end

When /^I should be redirect to (.*)$/ do |url|
  assert response.request.path == url
end

Given /^I have a link with title "(.*)" and url "(.*)" and description "(.*)"$/ do | title, url, description |

end

Given /^I have a comment comment_body "(.*)" from "(.*)"$/ do | body, name |
  
end