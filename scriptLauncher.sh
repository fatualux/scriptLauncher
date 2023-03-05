#!/bin/sh
#This script is used to launch other scripts.
#It depends on: bash

################################ FUNCTIONS ################################

ListActions() {
  # Display the list of choices to the user
  echo ""
  echo "Available actions:"
  echo "1. Translate a piece of text"
  echo "2. Download a media file"
  echo "3. Create a new script template"
  echo "4. Perform a web search"

  # Read the user's input and save it in a variable
  echo ""
  read -p "Select an option:" choice
  case "$choice" in
    1)
      echo "You chose to translate a piece of text."
      SCRIPT="scripts/translate.sh"
      ;;
    2)
      echo "You chose to download a media from the Internet."
      SCRIPT="scripts/download.sh"
      ;;
    3)
      echo "You chose to create a new bash script template."
      SCRIPT="scripts/newScript.sh"
      ;;
    4)
      echo "You chose to perform a web search."
      SCRIPT="scripts/webSearch.sh"
      ;;
    *)
      echo "Invalid selection"
      ;;
  esac

  # Export the user's input variable
  export SCRIPT
}

################################## SCRIPT ##################################

ListActions

sh "$SCRIPT"
