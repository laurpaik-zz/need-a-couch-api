#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/friendships"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "friendship": {
      "profile_id": "'"${PROFILE_ID}"'",
      "friend_id": "'"${FRIEND_ID}"'"
    }
  }'


  #  \
  # --header "Authorization: Token token=$TOKEN"

echo
