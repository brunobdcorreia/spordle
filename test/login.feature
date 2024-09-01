Feature: Login

    Scenario: User logs in
        Given I am on the login page
        When I click the {'Login to Spotify'} button
        When I enter {'user'} in the {'Login'} field
        And I enter {'password'} in the {'Password'} field
        And I click the {'Login'} button
        Then I should see the playlist page