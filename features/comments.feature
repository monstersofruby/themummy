Feature: Comments
  In order to have comments in the links
  As a common user
  I want to add comments into my links

	Scenario: Listing comments in links
	  Given I have a link with title "github" and url "http://github.com" and description "github is for developers"
		And I have a comment comment_body "coool!" from "felipe"
	  When I go to /links
		And I follow "github"
  	Then I should see "coool!"
		And I should see "felipe"
				
	Scenario: Creating comments in a link
	  Given I have a link with title "github" and url "http://github.com" and description "github is for developers"
  	And I go to /links
		And I follow "github"
		When I fill in "comment_body" with "coool!"
		And I fill in "comment_author" with "felipe"
  	Then I should see "coool!"
		And I should see "felipe" 