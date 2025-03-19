#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Script to insert data from games.csv into worldcup database
echo $($PSQL "TRUNCATE games, teams")

# TABLE GAMES
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $YEAR != "year" ]]
then
  # GET team_id for winner
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name ='$WINNER'")
  # if not found
    if [[ -z $WINNER_ID ]]
    then
      # insert winner team_id
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into TEAMS, $WINNER
      fi
    fi
    # GET team_id for OPPONENT
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name ='$OPPONENT'")

    if [[ -z $OPPONENT_ID ]]
    then
        # insert OPPONENT team_id
        INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
        if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
        then 
          echo Inserted into TEAMS, $OPPONENT
        fi  
      # get new team_id
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE (name ='$OPPONENT' OR name = '$WINNER')")
    fi
fi
# INSERT DATA
if [[ $YEAR != "year" ]] 
then 
  # get winner team_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE (name='$WINNER')")
  # get winner team_id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE (name='$OPPONENT')")

    # if not found
    if [[ -z $WINNER_ID ]]
    then
      # set to null
      WINNER_ID=null
    fi
        # if not found
    if [[ -z $OPPONENT_ID ]]
    then
      # set to null
      OPPONENT_ID=null
    fi
    # insert student
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS )")
    if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted into games, $YEAR $ROUND"
    fi
fi
done 