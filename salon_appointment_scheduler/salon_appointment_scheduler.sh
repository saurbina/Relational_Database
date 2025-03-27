#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "Welcome to My Salon, how can I help you?" 
  echo -e "\n1. cut\n2. color\n3. perm\n4. style\n5. trim"
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
      echo "What time would you like your cut, Fabio?"
      read SERVICE_TIME

      INSERT_HOUR_RESULT=$($PSQL "INSERT INTO customers(customer_id, service_id, time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')") 
      
      MAIN_MENU "I have put you down for a $service_name at $SERVICE_TIME, $CUSTOMER_NAME."
    else
      # get customer_id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

      echo "What time would you like your $SERVICE_TIME, $CUSTOMER_NAME?"
      read SERVICE_TIME 

      INSERT_HOUR_RESULT=$($PSQL "INSERT INTO customers(customer_id, service_id, time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')") 

      echo I have put you down for a $service_name at $SERVICE_TIME, $CUSTOMER_NAME.
    fi
  fi  
}

MAIN_MENU
