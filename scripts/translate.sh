#!/bin/bash
#This script requires the installation on translate-shell, a command-line translator powered by Google Translate (default),
#Bing Translator, Yandex.Translate, and Apertium (https://github.com/soimort/translate-shell).
#It depends on: bash translate-shell

################################ FUNCTIONS ################################

ListLanguages() {
  # Display the list of choices to the user
  echo ""
  echo "Choose the language of the translation:"
  echo "1. English"
  echo "2. Italian"
  echo "3. French"
  echo "4. Spanish"
  echo "5. Russian"
  echo "6. German"
  echo "7. Chinese"
  echo "8. Japanese"
  echo "9. Hindi"
  # Read the user's input and save it in a variable
  read -p "Enter your selection: " choice

  # Use the case statement to perform different actions based on the user's input
  case "$choice" in
    1)
      echo "You selected English."
      LANG="English"
      ;;
    2)
      echo "You selected Italian"
      LANG="Italian"
      ;;
    3)
      echo "You selected French"
      LANG="French"
      ;;
    4)
      echo "You selected Spanish"
      LANG="Spanish"
      ;;
    5)
      echo "You selected Russian"
      LANG="Russian"
      ;;
    6)
      echo "You selected German"
      LANG="German"
      ;;
    7)
      echo "You selected Chinese"
      LANG="Chinese"
      ;;
    8)
      echo "You selected Japanese"
      LANG="Japanese"
      ;;
    9)
      echo "You selected Hindi"
      LANG="Hindi"
      ;;
    *)
      echo "Invalid selection"
      ;;
  esac

  # Export the user's input variable
  export LANG
}

################################## SCRIPT ##################################

ListLanguages

echo ""
echo "Word or phrase?"
echo "(Press Ctrl + D when you have done typing, or Ctrl + C to cancel)"
echo ""
echo "________________________________________"
echo ""
read -r -d $'\04' TERM
echo Translating...

trans -no-play -t "$LANG" "$TERM"

echo ""
echo "Press any key to continue"
while [ true ] ; do
read -t 3 -n 1
if [ $? = 0 ] ; then
exit ;
else
sleep 1
fi
done
