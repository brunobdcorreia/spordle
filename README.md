# Spordle

Trabalho final da disciplina de Desenvolvimento Mobile. Jogo desenvolvido em Flutter. O usuário loga com sua conta do Spotify e seleciona uma ou mais playlists para jogar. O jogo consiste em adivinhar a música que está tocando. O usuário tem 5 chances para acertar a música. O jogo mantém registro de pontuação e tentativas do jogador.

## Integrantes
- Bruno Bacelar
- João Lucas Lima
- Kaio Oliveira

## Requisitos obrigatórios
### Feature: Selecionar playlist do Spotify
*Scenario: User views their Spotify playlists for song selection and select some of them*  
Given the user is logged on your correct Spotify account  
Given the user is on the playlist selection screen  
When the user sees {"My playlists"} section  
&emsp; And the user clicks "Show" button  
Then the list of available playlists should be displayed for selection  
&emsp; And the user selects {"Pop", "Rock", "Samba"} playlists  
Then the system must choose one of the songs from the selected playlists

### Feature: Escutar trecho da música
*Scenario: User listens to a short music snippet*  
Given the user is on the game screen  
When the user sees {"Listen to snippet of the song"}  
&emsp; And the user clicks on the {"play"} button  
Then the user should be able to hear a portion of the song

### Feature: Escrever suposições das músicas
*Scenario: User guesses a song by typing on the first try*  
Given the user is on the game screen  
Given that the correct answer is {"505"}  
When the user sees a text box  
&emsp;  And the user types {"505"}  
&emsp;  And the user clicks on the "Guess" button  
Then the system should show that answer is correct  

*Scenario: User doesn't guess the song on the first try*  
Given the user is on the game screen  
Given that the correct answer is {"Arabella"}  
When the user sees a text box  
&emsp; And the user types {"505"}  
&emsp; And the user clicks on the "Guess" button  
Then the system should show that the answer is wrong and show how many attempts are left  

### Feature: Visualizar pontuação ao acertar a música
*Scenario: User views their score after guessing a song*  
Given the user has guessed a song  
When the user sees their score  
&emsp; And the user click on {"Show more"} button  
Then the system must show discounts and additions to the respective score

### Feature: Visualizar sequência de acertos
*Scenario: User views their correct guess streak*  
Given the user is on the statistics screen  
When the user sees {"My profile"} section  
&emsp; And the user clicks on {"Streak"} button  
Then the correct guess streak should be displayed

## Critérios de Avaliação
- ter pelo menos 3 entidades
- ter pelo menos 3 telas
- usar o pacote Riverpod 2.5.* com gerador de código para gerenciamento de estado global
- usar arquitetura apresentada em aula, com Widgets, Controllers, Services, Repositories e Models
- usar persistência de dados (por exemplo, SQLite, SharedPreferences, etc.)
- ter testes automatizados, preferencialmente gerados a partir dos cenários criados pelos alunos de Engenharia de Software 2 para o pacote bdd_widget_test

## Protótipo
O protótipo do aplicativo foi feito no Figma e pode ser acessado [aqui](https://www.figma.com/proto/ugVow4eoedgm27guKSZggK/wire-frame?node-id=5-181&t=b8oHINXDwVy5Jj3f-1)
