# README


<!-- usersテーブル -->
| Column             | Type       | Options      |
| -------------------| -----------| ------------ |
|nickname            | string     | null: false  |
|email               | string     | null: false  |
|password            | string     | null: false  |
|last name           | string     | null:false   |
|first name          | string     | null:false   |
|furigana last name  | string     | null: false  |
|furigana first name | string     | null: false  |
|birthday            | string     | null: false  |

<!-- itemsテーブル -->
| Column             | Type       | Options      |
| -------------------| -----------| ------------ |
|image               | text       | null: false  |
|product name        | text       | null: false  |
|text                | text       | null: false  |
|category            | text       | null:false   |
|pay of shipping     | text       | null:false   |
|region of origin    | text       | null: false  |
|number of days until shipping    | text         | null: false  |
|price               | text       | null:false   |
|user id             | text       | null:false   |


<!-- purchaseテーブル -->
| Column             | Type        | Options      |
| -------------------| ----------- | ------------ |
|user id             | text        | null: false  |
|items id            | text        | null: false  |


<!-- addressテーブル -->
| Column             | Type       | Options      |
| -------------------| -----------| ------------ |
|post code           | text       | null: false  |
|prefecture          | text       | null: false  |
|municipalities      | text       | null: false  |
|street address      | text       | null:false   |
|building name       | text       | null:false   |
|telephone number    | text       | null: false  |
|user id             | text       | null: false  |
|items id            | text       | null:false   |
|purchase.id         | text       | null:false   |


<!--
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->
