Feature: Votes
  In order to have votes in the links
  As a common user
  I want to be able to vote the links

	Scenario: Have votes
	  Given I have a link with title "github" and url "http://github.com" and description "github is for developers"
	  When I go to /links
		Then I should see "0"
				
	Scenario: adding a vote
	  GivenScenario Have votes
  	And I go to /links
		When I follow "votes"
  	Then I should see "1" 