#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

generate_number() {
    echo $(( RANDOM % 1000 + 1 ))
}

is_valid_input(){
  local USER_INPUT="$1"
  if [[ $USER_INPUT =~ ^[0-9]+$ ]]
  then
    return 0 # gültig
  else
    return 1 # ungültig
  fi
}

check_number() {
  local SECRET_NUMBER="$1"
  local USER_INPUT="$2"
  local TRY="$3"

  if (( $SECRET_NUMBER < $USER_INPUT ))
  then
    echo "It's lower than that, guess again:"
  elif (( $SECRET_NUMBER > $USER_INPUT ))
  then
    echo "It's higher than that, guess again:"
  else
    echo "You guessed it in $TRY tries. The secret number was $SECRET_NUMBER. Nice job!"
    GAME_OVER=true
  fi
}

echo "Enter your username:"
read USERNAME
PLAYER_QUERY_RESULT=$($PSQL "SELECT * FROM players WHERE name = '$USERNAME';")

if [[ -z $PLAYER_QUERY_RESULT ]]
then
  DB_QUERY_RESULT=$($PSQL "INSERT INTO players(name) VALUES('$USERNAME');")
  PLAYER_QUERY_RESULT=$($PSQL "SELECT * FROM players WHERE name = '$USERNAME';")
  IFS='|' read -r PLAYER_ID PLAYER_NAME <<< $PLAYER_QUERY_RESULT
  echo "Welcome, $PLAYER_NAME! It looks like this is your first time here."
else
  IFS='|' read -r PLAYER_ID PLAYER_NAME <<< $PLAYER_QUERY_RESULT
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE player_id = $PLAYER_ID;")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE player_id = $PLAYER_ID;")
  echo "Welcome back, $PLAYER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$(generate_number)
TRIES=0
GAME_OVER=false
echo "Guess the secret number between 1 and 1000:"


while [ $GAME_OVER = false ]; do
  read USER_NUMBER_INPUT
  (( TRIES++ ))
  if ! is_valid_input "$USER_NUMBER_INPUT"
  then
    echo "That is not an integer, guess again:"
  else
    USER_NUMBER_INPUT=$(( 10#$USER_NUMBER_INPUT ))
    check_number "$SECRET_NUMBER" "$USER_NUMBER_INPUT" "$TRIES"
  fi
done

DB_QUERY_RESULT=$($PSQL "INSERT INTO games(player_id, number_of_guesses) VALUES($PLAYER_ID, $TRIES);")
