#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"
DISPLAY_SERVICES(){
echo -e "\n~~ SALON ~~\n"
SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
echo "$SERVICES" | while IFS="|" read SERVICE_ID NAME
do
echo "$SERVICE_ID) $NAME"
done
}

DISPLAY_SERVICES
echo -e "\nChoose a service:\n"
read SERVICE_ID_SELECTED
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

while [[ -z $SERVICE_NAME ]]
do
DISPLAY_SERVICES
echo -e "That service does not exist. Choose another option."
read SERVICE_ID_SELECTED
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
done


echo -e "\nEnter your phone number:\n"
read CUSTOMER_PHONE

CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

if [[ -z $CUSTOMER_NAME ]]
then
echo -e "\nWe do not have a record for that phone number. Enter your name:"
read CUSTOMER_NAME
INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
fi

CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

echo -e "When would you like to have your appointment?"
read SERVICE_TIME

INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(service_id, customer_id, time) VALUES($SERVICE_ID_SELECTED,$CUSTOMER_ID,'$SERVICE_TIME') ")

echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME." 