#!/bin/bash

# Check if URL argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# Send a GET request to the URL and display the body of the response for 200 status code
response=$(curl -s -o /dev/null -w "%{http_code}" "$1")
if [ "$response" -eq 200 ]; then
    body=$(curl -s "$1")
    echo "$body"
elif [ "$response" -ne 200 ]; then
    echo "Non-200 status code received: $response"
else
    echo "Failed to get response."
    exit 1
fi

