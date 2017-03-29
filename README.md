# Need-A-Couch: API
An API to store data on where users need to crash for a night

# Links
- [DEPLOYED APP](https://laurpaik.github.io/need-a-couch/)
- [FRONT-END REPO](https://github.com/laurpaik/need-a-couch)
- [DEPLOYED BACK-END](https://salty-earth-68321.herokuapp.com/)

### [ERD](https://goo.gl/photos/qyeshqtNUGRyE6Rh6)
### [ERD Reach Goal](https://goo.gl/photos/nc1WiSgVnCeU7NfcA)

## API End-Points

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |
| PATCH  | `/profiles/:id` | `profiles#update`  |
| POST  | `/couchposts` | `couchposts#create`  |
| GET | `/couchposts`        | `couchposts#index`   |
| GET   | `/couchposts/:id`             | `couchposts#show`    |
| PATCH   | `/couchposts/:id`             | `couchposts#update`    |
| DELETE  | `/couchposts/:id` | `couchposts#destroy`  |

---

### User Actions

#### POST /sign-up

The `create` action expects a *POST* of `credentials` and `athlete` information identifying a new user and athlete-profile to create, in this case using `getFormFields`:

```html
<form>
  <input name="credentials[email]" type="text" value="la@example.email">
  <input name="credentials[password]" type="password" value="an example password">
  <input name="credentials[password_confirmation]" type="password" value="an example password">
  <input name="athlete[given_name]" type="text" value="lauren">
  <input name="athlete[surname]" type="text" value="p">
  <input name="athlete[date_of_birth]" type="date" value="1990-01-01">
</form>
```
Request:

```sh
curl http://localhost:4741/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    },
    "athlete": {
      "given_name": "'"${GIVEN_NAME}"'",
      "surname": "'"${SURNAME}"'",
      "date_of_birth": "'"${DOB}"'"
    }
  }'
```

```sh
EMAIL='laur@en.com' PASSWORD='lauren' GIVEN_NAME='lauren' SURNAME='p' DOB='1993-01-16' sh scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "laur@en.com"
  }
}
```

#### POST /sign-in

Request:

```sh
curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL='laur@en.com' PASSWORD='lauren' sh scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "laur@en.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH "http://localhost:4741/change-password/$ID" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
```

```sh
ID=1 OLDPW='lauren' NEWPW='piss-ass' TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl http://localhost:4741/sign-out/$ID \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' ID=1 sh scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl http://localhost:4741/users \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "bob@ava.com"
    },
    {
      "id": 1,
      "email": "ava@bob.com"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' ID=1 sh scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "laur@en.com"
  }
}
```

### Profile Actions

All profile action requests must include a valid HTTP header `Authorization: Token token=<token>` or they will be rejected with a status of 401 Unauthorized.

#### update

Request:
```sh
curl http://localhost:4741/athletes \
  --include \
  --request PATCH \
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
```

```sh
ID=1 TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' ID=1 GIVEN_NAME='Lauren' SURNAME='McFace' GENDER='f' DOB='1993-01-01' sh scripts/profiles/update.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

The `update` action is a *PATCH* that updates the athlete who has authorization. It expects a PATCH of `profile` specifying `given_name`, `surname`, `gender`, and `dob`.

If the request is successful, the response will have an HTTP status of 204 No Content.

If the request is unsuccessful, the response will have an HTTP status of 400 Bad Request.

### Couchpost Actions

All couchpost action requests must include a valid HTTP header `Authorization: Token token=<token` or they will be rejected with a status of 401 Unauthorized.

#### create

The `create` action is a *POST* that creates a new couchpost for the user signed in. It expects a POST of `couchpost` specifying `location`, `date_needed`, and `couch_found`. The user's id number automatically is assigned to `profile_id`, as the two id numbers will be the same (see `signup`).

Request:

```sh
curl http://localhost:4741/couchposts \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "couchpost": {
      "location": "'"${LOCATION}"'",
      "date_needed": "'"${DATE_NEEDED}"'",
      "couch_found": "'"${COUCH_FOUND}"'",
      "profile_id": "'"${PROFILE_ID}"'"
    }
  }'
```

```sh
ID=1 TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' LOCATION='Boston' DATE_NEEDED='2017-03-31' COUCH_FOUND='no' PROFILE_ID=1 sh scripts/athletes/update.sh
```

The response will have an HTTP status of 201 Created, and the body will contain JSON of the created log:
```json
{
  "id":7,
  "location":"Boston",
  "date_needed":"2017-03-31",
  "couch_found":"no",
  "profile":{
    "id":1,
    "given_name":"lauren",
    "surname":"paik",
    "date_of_birth":"1993-01-16",
    "editable":true,
  }
}
```

#### index

The `index` action is a *GET* that retrieves all couchposts.

Request:

```sh
curl http://localhost:4741/couchposts \
  --include \
  --request GET
```

```sh
sh scripts/couchposts/index.sh
```

The response body will contain JSON containing an array of couchposts, e.g.:

```json

```

If a `user` is logged in, then `index` will return `editable` as true for that user's profile.

#### show

The `show` action is a *GET* that retrieves a given couchpost.

Request:

```sh
curl http://localhost:4741/couchposts/$ID \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' ID=1 sh scripts/couchposts/show.sh
```

The response body will contain a JSON object of that couchpost, e.g.:
```json

```

#### update

The `update` action is a *PATCH* that updates a couchpost for a user who has authorization. It expects a PATCH of `couchpost` specifying `location`, `date_needed`, and `couch_found`. The user's id number automatically is assigned to `profile_id`.

Request:
```sh
curl http://localhost:4741/couchposts/$ID \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "couchpost": {
      "location": "'"${LOCATION}"'",
      "date_needed": "'"${DATE_NEEDED}"'",
      "couch_found": "'"${COUCH_FOUND}"'"
    }
  }'
```

```sh
TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' ID=1 LOCATION='Somerville' DATE_NEEDED='2017-02-22' COUCH_FOUND='yes' sh scripts/couchposts/show.sh
```

If the request is successful, the response will have an HTTP status of 204 No Content.

If the request is unsuccessful, the response will have an HTTP status of 400 Bad Request.

#### destroy

The `destroy` action is a *DELETE* that deletes a couchpost for a user who has authorization.

Request:
```sh
curl http://localhost:4741/couchposts/$ID \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' ID=20 sh scripts/couchposts/destroy.sh
```
If the request is successful, the response will have an HTTP status of 204 No Content.

If the request is unsuccessful, the response will have an HTTP status of 400 Bad Request.

### My Struggles and Lessons Learned


### Future Goals


### Built With:
- Ruby
- Ruby on Rails
- PostgreSQL
