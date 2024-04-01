#!/bin/bash

# Check if URL argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# Send an OPTIONS request to the URL and display the allowed methods
allowed_methods=$(curl -s -i -X OPTIONS "$1" | grep -i Allow | cut -d':' -f2)

echo "Allowed HTTP methods for $1 are: $allowed_methods"

