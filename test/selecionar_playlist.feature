Feature: Selecionar playlist do Spotify

Scenario: User views their Spotify playlists for song selection and select some of them
Given the user is logged on your correct Spotify account
Given the user is on the playlist selection screen
When the user sees {"My playlists"} section
  And the user selects {"ebaaaaa"} playlist
Then the system must choose one of the songs from the selected playlists