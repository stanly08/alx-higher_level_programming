#!/bin/bash

# Check if URL argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# Send a request to the URL and get the size of the response body in bytes
response=$(curl -sI "$1" | grep -i content-length | awk '{print $2}' | tr -d '\r')
if [ -z "$response" ]; then
    echo "Failed to get response size."
    exit 1
fi

echo "Response size: ${response} bytes"

