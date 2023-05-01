# テーブル設計

## users テーブル

| カラム名            | 型      | バリデーション|
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| profile            | text   | null: false |
| occupation         | text   | null: false |
| position           | text   | null: false |

### アソシエーション

- has_many :prototypes
- has_many :comments

## prototypes テーブル

| カラム名      | 型          | バリデーション|
| ------       | ------     | ----------- |
| title        | string     | null: false |
| catch-copy   | text       | null: false |
| concept      | text       | null: false |
| user         | references | null: false |

### アソシエーション

- has_many :comments
- belongs :users

## comments テーブル

| カラム名   | 型         | バリデーション                   |
| -------  | ---------- | ------------------------------ |
| content  | string     |                                |
| prototype| references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### アソシエーション

- belongs_to :prototypes
- belongs_to :user