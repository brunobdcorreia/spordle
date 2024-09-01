Feature: Visualizar pontuação ao acertar a música
Scenario: User views their score after guessing a song
Given the user has guessed a song
When the user sees their score
  And the user click on {"Show more"} button
Then the system must show discounts and additions to the respective score