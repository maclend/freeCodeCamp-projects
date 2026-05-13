#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
echo "Please provide an element as an argument."
exit 0
fi

INPUT=$1

ELEMENT_INFO=$($PSQL "SELECT e.atomic_number,e.name,e.symbol,t.type,p.atomic_mass,p.melting_point_celsius,p.boiling_point_celsius FROM properties p JOIN types t USING (type_id)JOIN elements e USING (atomic_number) WHERE e.atomic_number::text='$INPUT' OR e.symbol='$INPUT' OR e.name='$INPUT';")

if [[ -z $ELEMENT_INFO ]]
then
echo "I could not find that element in the database."
exit 0
fi

echo $ELEMENT_INFO | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
do
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
done
