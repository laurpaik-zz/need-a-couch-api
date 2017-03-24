#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/profiles"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "profile": {
      "given_name": "'"${GIVEN_NAME}"'",
      "surname": "'"${SURNAME}"'",
      "gender": "'"${GENDER}"'",
      "dob": "'"${DOB}"'"
    }
  }'


  #  \
  # --header "Authorization: Token token=$TOKEN"

echo
