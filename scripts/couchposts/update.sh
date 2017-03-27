#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/couchposts/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "couchpost": {
      "location": "'"${LOCATION}"'",
      "date_needed": "'"${DATE}"'",
      "couch_found": "'"${COUCH_FOUND}"'"
    }
  }'
   #\
  # --header "Authorization: Token token=$TOKEN"

echo
