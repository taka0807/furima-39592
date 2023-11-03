# README


<!-- usersテーブル -->
| Column             | Type       | Options      |
| -------------------| -----------| ------------ |
|nickname            | string     | null:false   |
<!-- |email               | string     | unique: true |間違えた -->
|email               | string     | unique:true  |
<!-- |password            | string     | null: false  |間違えた。データベースには暗号化して保存するため。 -->
|encrypted_password  | string     | null:false   |
|last_name           | string     | null:false   |
|first_name          | string     | null:false   |
|furigana_last_name  | string     | null:false   |
|furigana_first_name | string     | null:false   |
|birthday            | date       | null:false   |
カラム名はスネークケースで記載。

<!-- itemsテーブル -->
| Column             | Type       | Options      |
| -------------------| -----------| ------------ |
<!-- |image| string     | null: false  |image不要。active_storage導入時に自動でテーブルなどが生成される -->
|product_name        | string     | null:false   |
|text                | text       | null:false   |
|category_id            | integer | null:false   |
|pay_of_shipping_id     | integer | null:false   |
|region_of_origin_id    | integer | null:false   |
|number_of_days_until_shipping_id | integer      | null: false  |
<!-- |category            | text       | null:false   | -->
<!-- |pay_of_shipping     | text       | null:false   | -->
<!-- |region_of_origin    | text       | null:false   | -->
<!-- |number_of_days_until_shipping    | text         | null: false  | -->
|price               | integer    | null:false   |
<!-- |price               | text       | null:false   | -->
<!-- 金額は数値で入力されるため、Typeにはinteger型を指定 -->
|user                | references | null:false   |


<!-- purchaseテーブル -->
| Column             | Type       | Options      |
| -------------------| -----------| ------------ |
|user                | references | null:false   |
|items               | references | null:false   |


<!-- addressテーブル -->
| Column             | Type       | Options      |
| -------------------| -----------| ------------ |
|post_code           | integer       | null:false   |
|prefecture          | integer       | null:false   |
<!-- |prefecture          | integer       | null:false   | -->
|municipalities      | string     | null:false   |
|street_address      | string     | null:false   |
|building_name       | string     |              |
<!-- 建物名は必須項目ではないため、null:falseオプションは削除 -->
<!-- 住所の情報は短い文字列で管理ができるため、typeにはstring型を指定 -->
|telephone_number    | string     | null:false   |
<!-- |telephone_number    | text       | null:false   | -->
<!-- 電話番号カラムのTypeはstringに変更。integer型だと0から始まる数値を扱うことが出来ないため。 -->
<!-- ※電話番号は0から始まります。integer型だと、最初の0が省略されてしまう。 -->
<!-- |user                | references | null:false   | -->
<!-- |items               | references | null:false   | -->
<!-- 購入管理テーブルで管理するため、不要 -->
|purchase            | references | null:false   |


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
