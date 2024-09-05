#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# init num regex, count, and generate rand num in variable
COUNT=1
INT_REGEX='^[0-9]+$'
NUMBER=$((1 + RANDOM % 1000)) # generate rand num 1-1000
CHECK_USER() {
  # prompt for username
  echo "Enter your username:"
  read USERNAME
  USER_CHECK=$($PSQL "SELECT username FROM scores WHERE username='$USERNAME'")
  # if user not in db: welcome
  if [[ -z $USER_CHECK ]]
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    ADD_USER=$($PSQL "INSERT INTO scores(username,games_played,best_score) VALUES('$USERNAME',0,0)")
    SCORE_CHECK=0
  # else: welcome back
  else
    GAMES_CHECK=$($PSQL "SELECT games_played FROM scores WHERE username='$USERNAME'")
    SCORE_CHECK=$($PSQL "SELECT best_score FROM scores WHERE username='$USERNAME'")
    # ^ wanted to grab both of these in the first query, but couldn't read them out properly
    echo "Welcome back, $USERNAME! You have played $GAMES_CHECK games, and your best game took $SCORE_CHECK guesses."
  fi

  GUESSING_GAME
}

GUESSING_GAME() {
  # echo guess num string
  echo "Guess the secret number between 1 and 1000:"
  # read user input
  read GUESS
  # compare input to generated num
  while [[ $GUESS != $NUMBER ]]
  do
    # if not a number: echo "not an int"
    if [[ ! $GUESS =~ $INT_REGEX  ]]
    then
      echo "That is not an integer, guess again:"
      read GUESS
    # if guess is too high: echo "it's lower"
    elif (( $GUESS > $NUMBER ))
    then
      echo "It's lower than that, guess again:"
      read GUESS
    # if too low: echo "it's higher"
    elif (( $GUESS < $NUMBER ))
    then
      echo "It's higher than that, guess again:"
      read GUESS
    fi
    ((COUNT=COUNT+1))
  done
  # else: "you guessed it"
  echo "You guessed it in $COUNT tries. The secret number was $NUMBER. Nice job!"
  DB_UPDATE
}

DB_UPDATE() {
  # update games played and best score (if beaten)
  GAMES=$((GAMES_CHECK+1))
  if (( $SCORE_CHECK == 0 )) || (( $COUNT < $SCORE_CHECK ))
  then
    UPDATE_DB=$($PSQL "UPDATE scores SET games_played=$GAMES,best_score=$COUNT WHERE username='$USERNAME'")
  else
    DB_UPDATE=$($PSQL "UPDATE scores SET games_played=$GAMES WHERE username='$USERNAME'")
  fi
}

CHECK_USER