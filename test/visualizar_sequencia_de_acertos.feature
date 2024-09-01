Feature: Visualizar sequência de acertos
Scenario: User views their correct guess streak
Given the user is on the statistics screen
When the user sees {"My profile"} section
  And the user clicks on {"Streak"} button
Then the correct guess streak should be displayed