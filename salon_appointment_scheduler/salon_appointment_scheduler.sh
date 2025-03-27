#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services")

  echo -e "Welcome to My Salon, how can I help you?\n" 
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID NAME
  do
    echo "$SERVICE_ID) $NAME" | sed -r 's/ \|//g'
  done
  read SERVICE_ID_SELECTED

  # get service
  SERVICE_ID=$($PSQL "SELECT service_id  FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  SERVICE_NAME=$($PSQL "SELECT name  FROM services WHERE service_id = $SERVICE_ID")
  # if no service_id 
  if [[ -z $SERVICE_ID ]]
  then
    # send to main menu
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    # phone service
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    name=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # if customer doesn't exist
    if [[ -z $name ]]
    then # get customer name
      echo -e "\nWhat's your name?"
      read CUSTOMER_NAME

      # insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')") 
      
      # get customer_id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      
      # ASK HOUR 
      echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
      read SERVICE_TIME

      INSERT_HOUR_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')") 
      
      echo "I have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
    else
      # get customer_id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

      echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $name | sed -r 's/^ *| *$//g')?" 
      read SERVICE_TIME 
      
      INSERT_HOUR_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')") 

      CLIENT_INFO=$($PSQL "SELECT * FROM appointments LEFT JOIN customers USING(customer_id)")

      echo "I have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $name | sed -r 's/^ *| *$//g')."

    fi
  fi  
}

MAIN_MENU
