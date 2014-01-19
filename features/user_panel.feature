Feature: In order to better understand the functionality of the application and retain interest, users
		 are able to modify settings and see upcoming flybys

	Scenario: View upcoming ISS flybys
		Given I am an authenticated google user
		And I have the following upcoming flybys:
		|       Risetime        |    Duration in minutes  |   
		|  Sat Jan 25, 6:53 AM  |             4           |
		|  Sun Jan 26, 6:05 AM  |			  3           |
		|  Mon Jan 27, 6:52 AM  |             4           |
		When I go to the homepage
		And I click "Sign in with Google"
		Then I see the page has reloaded, and shows "Signed in with Google."
		And the page shows:
		|      		Upcoming Flybys        |
		|  Sat Jan 25, 6:53 AM  (4 mins.)  |
		|  Sun Jan 26, 6:05 AM  (3 mins.)  |
		|  Mon Jan 27, 6:52 AM  (4 mins.)  |

	Scenario: Access user panel
		Given I am an authenticated google user
		When I go to the homepage
		And I click "Sign in with Google"
		Then I see the page has reloaded, and shows "Signed in with Google."
		And I click "Sign Out"
		Then I am redirected to the landing page
		And I see the message "Successfully signed out"

	Scenario: Send test card
		Given I am an authenticated google user
		When I go to the homepage
		And I click "Sign in with Google"
		And I see the page has reloaded, and shows "Signed in with Google."
		Then I click "Send test card to my Google Glass"
		And I am sent a card saying "ISS Flyby in 10 minutes!"
		