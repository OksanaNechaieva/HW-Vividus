Scenario: Verify that allows login a User
When I add request headers:
|name           |value  |
|username       |string |
|password       |string |
When I execute HTTP GET request for resource with relative URL `/user/login`
Then response code is equal to `200`
When I save JSON element from `${response}` by JSON path `$.message` to scenario variable `sessionValue`


Scenario: Verify that allows creating a User
When I add request headers:
|name         |value  |
|Content-Type |application/json |
Given request body: {
  "id": 5,
  "username": "string2",
  "firstName": "string2",
  "lastName": "string2",
  "email": "string@email.com",
  "password": "string",
  "phone": "string",
  "userStatus": 0
}
When I execute HTTP POST request for resource with relative URL `/user`
Then response code is equal to `200`

Scenario: Verify that allows creating a list of Users
When I add request headers:
|name         |value  |
|Content-Type |application/json |
Given request body: {
    "id": 0,
    "username": "string,
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 0
  }
When I execute HTTP POST request for resource with relative URL `/user/createWithList`
Then response code is equal to `200`


Scenario: Verify that allows log out
When I execute HTTP GET request for resource with relative URL `/user/logout`
Then response code is equal to `200`

Scenario: Verify that allows adding a new Pet
When I add request headers:
|name         |value  |
|Content-Type |application/json |
Given request body: {
  "id": 3,
  "category": {
    "id": 3,
    "name": "string"
  },
  "name": "doggie",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 3,
      "name": "string"
    }
  ],
  "status": "available"
}
When I execute HTTP POST request for resource with relative URL `/pet`
Then response code is equal to `200`


Scenario: Verify that allows updating Pet’s name and status
When I add request headers:
|name         |value  |
|Content-Type |application/json |
Given request body: {
  "id": 3,
  "name": "doggie2",
  "status": "unavailable"
}
When I execute HTTP PUT request for resource with relative URL `/pet`
Then response code is equal to `200`


Scenario: Verify that allows deleting Pet 
When I add request headers:
|name         |value  |
|Content-Type |application/json |
When I execute HTTP DELETE request for resource with relative URL `/pet/3`
Then response code is equal to `200`




