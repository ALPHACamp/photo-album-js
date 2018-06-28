# README

## API 網址

```
http://35.185.111.183/api/v1/{router}
```

## API List
- [Photo Index](https://github.com/ALPHACamp/photo-album-js#photos-index)
- [Show Photo](https://github.com/ALPHACamp/photo-album-js#show-photo)
- [Create Photo](https://github.com/ALPHACamp/photo-album-js#create-photo)
- [Update Photo](https://github.com/ALPHACamp/photo-album-js#update-photo)
- [Delete Photo](https://github.com/ALPHACamp/photo-album-js#delete-photo)
- [Sign up](https://github.com/ALPHACamp/photo-album-js#sign-up)
- [Login](https://github.com/ALPHACamp/photo-album-js#login)
- [Logout](https://github.com/ALPHACamp/photo-album-js#logout)


## Photos Index

#### Method & URL
```
GET /photos
```

#### Parameter
None

#### Success Response
``` json
{
  "data": [
    {
      "id": 1,
      "title": "Myra's Birthday",
      "description": "This is my favourite photo",
      "file_location": {
        "url": "/uploads/photo/file_location/1/myra-birthday.png"
      }
    },
    {
      "id": 2,
      "title": "Family outing",
      "description": "Spending some time at the park after a long week.",
      "file_location": {
        "url": "/uploads/photo/file_location/1/family-outint.png"
      }
    }
  ]
}
```

## Show Photo

#### Method & URL
```
GET /photos/:id
```

#### Parameter
##### Path parameter
`id`
##### Query string parameters

|Params| Require| Type
|---|---|---|
|`auth_token`|require|String|

#### Response

##### Success

``` json
{
  "id": 1,
  "title": "Myra's Birthday",
  "description": "This is my favourite photo",
  "file_location": {
    "url": "/uploads/photo/file_location/1/myra-birthday.png"
  }
}
```
##### Failure
``` json
{
  "error": "You need to sign in or sign up before continuing."
}
```

## Create Photo

#### Method & URL
```
POST /photos
```

#### Parameter

##### Query string parameters

|Params| Require| Type
|---|---|---|
|`auth_token`|require|String|
|`title`|require|String|
|`description`|optional|text|
|`date`|optional|datetime|
|`file_location`|optional|file|

#### Response

##### Success

``` json
{
  "message": "Photo created successfully!",
  "result": {
    "id": 3,
    "title": "My Photo",
    "date": "2018-02-02",
    "description": "My Photo Description",
    "file_location": {
      "url": "/uploads/photo/file_location/3/my-photo.jpg"
    },
    "created_at": "2018-06-28T04:09:16.000Z",
    "updated_at": "2018-06-28T04:09:16.000Z"
  }
}
```
##### Failure
``` json
{
  "errors": {
    "title": [
      "can't be blank"
    ]
  }
}
```

## Update Photo

#### Method & URL
```
Patch /photos/:id
```

#### Parameter
##### Path parameter
`id`

##### Query string parameters

|Params| Require| Type
|---|---|---|
|`auth_token`|require|String|
|`title`|require|String|
|`description`|optional|text|
|`date`|optional|datetime|
|`file_location`|optional|file|

#### Response

##### Success

``` json
{
  "message": "Photo created successfully!",
  "result": {
    "id": 3,
    "title": "My Photo",
    "date": "2018-02-02",
    "description": "My Photo Description",
    "file_location": {
      "url": "/uploads/photo/file_location/3/my-photo.jpg"
    },
    "created_at": "2018-06-28T04:09:16.000Z",
    "updated_at": "2018-06-28T04:09:16.000Z"
  }
}
```
##### Failure
``` json
{
  "errors": {
    "title": [
      "can't be blank"
    ]
  }
}
```
## Delete Photo

#### Method & URL
```
Delete /photos/:id
```

#### Parameter
##### Path parameter
`id`

##### Query string parameters

|Params| Require| Type
|---|---|---|
|`auth_token`|require|String|

#### Response

##### Success

``` json
{
  "message": "Photo destroy successfully!"
}
```

## Sign up

#### Method & URL
```
POST /signup
```

#### Parameter
##### Query string parameters

|Params| Require| Type
|---|---|---|
|`email`|require|String|
|`Password`|require|String|

#### Response

##### Success

``` json
{
  "user_id": 1
}
```
##### Failure
``` json
{
  "message": "Failed",
  "errors": {
    "email": [
       "has already been taken"
    ],
    "password": [
        "can't be blank"
    ]
  }
}
```

## Login

#### Method & URL
```
POST /login
```

#### Parameter
##### Query string parameters

|Params| Require| Type
|---|---|---|
|`email`|require|String|
|`Password`|require|String|

#### Response

##### Success

``` json
{
  "message": "Ok",
  "auth_token": "5_tbEF-XQVyxEozsua3Q",
  "user_id": 1
}
```
##### Failure
``` json
{
  "message":  "Email or Password is wrong"
}
```

## Logout

#### Method & URL
```
POST /logout
```

#### Parameter
##### Query string parameters

|Params| Require| Type
|---|---|---|
|`auth_token`|require|String|
#### Response

##### Success

``` json
{
  "message": "Ok",
}
```
