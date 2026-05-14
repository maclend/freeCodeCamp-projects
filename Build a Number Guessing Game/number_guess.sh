#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$(( RANDOM % 1000 + 1))

echo "Enter your username:"
read USERNAME

USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_INFO ]]
then
echo "Welcome, $USERNAME! It looks like this is your first time here."
INSERT_USER_RESULT=$($PSQL "INSERT INTO users (username, games_played, best_game) VALUES ('$USERNAME', 0, NULL)")
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
else
echo "$USER_INFO" | while IFS="|" read GAMES_PLAYED BEST_GAME
do
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
done
fi



echo "Guess the secret number between 1 and 1000:"
NUMBER_OF_GUESSES=0

while true
do
read GUESS

if [[ ! $GUESS =~ ^[0-9]+$ ]]
then
echo "That is not an integer, guess again:"
else
NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
    
if [[ $GUESS -eq $SECRET_NUMBER ]]
then
break

elif [[ $GUESS -gt $SECRET_NUMBER ]]
then
echo "It's lower than that, guess again:"

else
echo "It's higher than that, guess again:"
fi

fi

done

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID")
NEW_GAMES_PLAYED=$((GAMES_PLAYED + 1))

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
INSERT_GAME_RESULT=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE user_id = $USER_ID")

BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id = $USER_ID")

if [[ -z $BEST_GAME || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
then
UPDATE_BEST_RESULT=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE user_id = $USER_ID")
fi
