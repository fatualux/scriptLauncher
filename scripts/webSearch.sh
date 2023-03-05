#!/bin/bash
#This script opens a shell prompt, asks user for a text and search that on google.com.
#It depends on: bash w3m

echo ""
echo="What are you looking for?"
echo ""
read -r QUERY

URL=$(echo -ne "http://www.google.com/search?ie=ISO-8859-1&hl=it&source=hp&q=""$QUERY")

w3m "$URL"
