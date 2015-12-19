# Milk

This repo is just an API server for for studying Javascript, creating Single Page Application.

## Run server

`$ rails s`

## API samples

### Project

- INDEX

`curl -X GET http://localhost:3000/api/v1/projects`

- SHOW

`curl -X GET http://localhost:3000/api/v1/projects/1`

- PUT

`curl -X PUT http://localhost:3000/api/v1/projects/1 -d 'title=hello'`

- CREATE

`curl -X POST http://localhost:3000/api/v1/projects -d 'title=Christmas'`

- DELETE

`curl -X DELETE http://localhost:3000/api/v1/projects/2`

### Todo

- INDEX

`curl -X GET http://localhost:3000/api/v1/projects/6/todos`

- SHOW

`curl -X GET http://localhost:3000/api/v1/todos/11`

- PUT

`curl -X PUT http://localhost:3000/api/v1/todos/3 -d 'title=hey' -d 'completed_at=1450103853'`

- CREATE

`curl -X POST http://localhost:3000/api/v1/projects/7/todos -d 'title=Get milk'`

- DELETE

`curl -X DELETE http://localhost:3000/api/v1/todos/11`
