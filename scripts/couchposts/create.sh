#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/couchposts"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "couchpost": {
      "location": "'"${LOCATION}"'",
      "date_needed": "'"${DATE}"'",
      "couch_found": "'"${COUCH_FOUND}"'",
      "profile_id": "'"${PROFILE_ID}"'"
    }
  }'


  #  \
  # --header "Authorization: Token token=$TOKEN"

echo
