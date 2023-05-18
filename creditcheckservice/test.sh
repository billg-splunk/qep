#!/bin/bash

URL="http://localhost:8888"

# Make a GET request to the microservice endpoint and store the response in a variable
testResponse=$(curl -s "$URL" +"/test)

# Check the response and print the result
if [[ $testResponse == "OK" ]]; then
    echo "Test passed!"
else
    echo "Test failed."
fi