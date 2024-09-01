Feature: Escrever suposições das músicas

Scenario: User guesses a song by typing on the first try
Given the user is on the game screen
Given that the correct answer is {"505"}
When the user sees a text box
  And the user types {"505"}
  And the user clicks on the "Guess" button
Then the system should show that answer is correct

Scenario: User doesn't guess the song on the first try
Given the user is on the game screen
Given that the correct answer is {"Arabella"}
When the user sees a text box
  And the user types {"505"}
  And the user clicks on the "Guess" button
Then the system should show that the answer is wrong and show how many attempts are left