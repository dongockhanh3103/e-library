# YOJEE
Oivan Assignment
## Usage

Go to: http://yojee-e-library.herokuapp.com/
- Database: PostgreSql
- Rails version: 6.1.3
- Ruby version: 3.0.3
- Front-end Framework: React JS

## Feature
- [X] Create Book, Song, Combo
- [X] Search Label by Book, Song, Combo name
- [X] List Book, Song, Combo, Label
- [X] Most Popular Labels

3. API

| Feature       | API           | Method        | Params        | Headers       |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| Create Book         | /v1/books  | POST  | name, description, label_id |   |
| Create Song         | /v1/songs  | POST  | name, description, label_id |   |
| Create Book         | /v1/combos  | POST  | book_id, label_id, song_id |   |
| Most Popular Labels         | /v1/labels  | GET  | |   |
| Search Labels         | /v1/labels/search  | GET  | term, search_by |   |

## Unit Test
  - [X] Service
  - [X] Request

## Best practices
  - [X] Rubocop
  - [X] Unit Test
## Devops
  - [X] Auto run Rubocop after create PR on Github Action
  - [X] Auto run Unit Test after create PR on Github Action
  - [X] Go live application to Heroku
