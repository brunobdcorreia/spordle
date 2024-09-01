Feature: Escutar trecho da música
Scenario: User listens to a short music snippet
Given the user is on the game screen
When the user sees {"Listen to snippet of the song"}
  And the user clicks on the {"play"} button
Then the user should be able to hear a portion of the song