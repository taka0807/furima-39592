# README


## users table
| Column             | Type       | Options      |
| -------------------| -----------| ------------ |
|nickname            | string     | null:false   |
|email               | string     | null:false, unique:true  |
|encrypted_password  | string     | null:false   |
|last_name           | string     | null:false   |
|first_name          | string     | null:false   |
|furigana_last_name  | string     | null:false   |
|furigana_first_name | string     | null:false   |
|birthday            | date       | null:false   |

<!-- Association -->
- has_many :items
- has_many :purchases


## items table
| Column             | Type       | Options      |
| -------------------| -----------| ------------ |
|productname         | string     | null:false   |
|explanation         | text       | null:false   |
|category_id         | integer    | null:false   |
|product_condition_id| integer    | null:false   |
|pay_of_shipping_id  | integer    | null:false   |
|region_of_origin_id | integer    | null:false   |
|number_of_days_until_shipping_id | integer      | null: false    |
|price               | integer    | null:false   |
|user                | references | null:false, foreign_key: true |

<!-- Association -->
- belongs_to :user
- has_one :purchase


## purchases table
| Column             | Type       | Options      |
| -------------------| -----------| ------------ |
|user                | references | null:false, foreign_key: true |
|item                | references | null:false, foreign_key: true |

<!-- Association -->
- has_one :address
- belongs_to :user
- belongs_to :item


## addresses table
| Column             | Type       | Options      |
| -------------------| -----------| ------------ |
|post_code           | string     | null:false   |
|region_of_origin_id | integer    | null:false   |
|municipalities      | string     | null:false   |
|street_address      | string     | null:false   |
|building_name       | string     |              |
|telephone_number    | string     | null:false   |
|purchase            | references | null:false, foreign_key: true   |

<!-- Association -->
- belongs_to :purchase










<!-- usersテーブル -->
<!-- table名は複数名 -->
<!-- | Column             | Type       | Options      | -->
<!-- | -------------------| -----------| ------------ | -->
<!-- |nickname            | string     | null:false   | -->
<!-- |email               | string     | null:false, unique:true  | -->
<!-- |encrypted_password  | string     | null:false   | -->
<!-- |last_name           | string     | null:false   | -->
<!-- |first_name          | string     | null:false   | -->
<!-- |furigana_last_name  | string     | null:false   | -->
<!-- |furigana_first_name | string     | null:false   | -->
<!-- |birthday            | date       | null:false   | -->

<!-- Association -->
<!-- - has_many :items -->
<!-- - has_many :purchases -->





<!-- itemsテーブル -->
<!-- | Column             | Type       | Options      | -->
<!-- | -------------------| -----------| ------------ | -->
<!-- |image| string     | null: false  |image不要。active_storage導入時に自動でテーブルなどが生成される -->
<!-- |product_name        | string     | null:false   | -->
<!-- |text                | text       | null:false   | -->
<!-- |category_id         | integer    | null:false   | -->
<!-- |product condition   | integer    | null:false   | -->
<!-- |pay_of_shipping_id     | integer | null:false   | -->
<!-- |region_of_origin_id    | integer | null:false   | -->
<!-- |number_of_days_until_shipping_id | integer      | null: false  | -->
<!-- |category            | text       | null:false   | -->
<!-- |pay_of_shipping     | text       | null:false   | -->
<!-- |region_of_origin    | text       | null:false   | -->
<!-- |number_of_days_until_shipping    | text         | null: false  | -->
<!-- |price                    | integer    | null:false   | -->
<!-- |price               | text       | null:false   | -->
<!-- 金額は数値で入力されるため、Typeにはinteger型を指定 -->
<!-- |user                | references | null:false,foreign_key: true   | -->
<!-- 外部キー時はforeign_key: trueを入れる。 -->

<!-- Association -->
<!-- - belongs_to :user -->
<!-- - has_one :purchase -->


<!-- purchaseテーブル -->
<!-- | Column             | Type       | Options      | -->
<!-- | -------------------| -----------| ------------ | -->
<!-- |user                | references | null:false   | -->
<!-- |item                | references | null:false   | -->

<!-- Association -->
<!-- - has_one :address -->
<!-- - belongs_to :user -->
<!-- - belongs_to :item -->


<!-- addressテーブル -->
<!-- | Column             | Type       | Options      | -->
<!-- | -------------------| -----------| ------------ | -->
<!-- |post_code           | string    | null:false   | -->
<!-- |region_of_origin_id | integer    | null:false   | -->
<!-- |prefecture          | integer       | null:false   | -->
<!-- itemカラムの都道府県と合わせる。と当初はprefectureと記載。 -->
<!-- |municipalities      | string     | null:false   | -->
<!-- |street_address      | string     | null:false   | -->
<!-- |building_name       | string     |              | -->
<!-- 建物名は必須項目ではないため、null:falseオプションは削除 -->
<!-- 住所の情報は短い文字列で管理ができるため、typeにはstring型を指定 -->
<!-- |telephone_number    | string     | null:false   | -->
<!-- |telephone_number    | text       | null:false   |/ -->
<!-- 電話番号カラムのTypeはstringに変更。integer型だと0から始まる数値を扱うことが出来ないため。 -->
<!-- ※電話番号は0から始まります。integer型だと、最初の0が省略されてしまう。 -->
<!-- |user                | references | null:false   | -->
<!-- |items               | references | null:false   | -->
<!-- 購入管理テーブルで管理するため、不要 -->
<!-- |purchase            | references | null:false   | -->

<!-- Association -->
<!-- - belongs_to :purchase -->







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
