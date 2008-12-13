Feature: Managing Links
  In order have post
  As a common user
  I want to be able to create a post and list a post

	Scenario: Listing post
	  Given I have a link with title "github" and url "http://github.com" and description "github is for developers"
	  When I go to /links
	  Then I should see "github"
		And I should see "http://github.com"
		And I should see "github is for developers"
		
	Scenario: Creating post
  	When I go to /links/new
		And I fill in "title" with "github"
		And I fill in "url" with "http://github.com"
		And I fill in "description" with "github is for developers"
		And I press "OK"		
  	Then I should see "github"
		And I should see "http://github.com"
		And I should see "github is for developers"
