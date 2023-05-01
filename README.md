# テーブル設計です

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

- has_many :prototypes_users
- has_many :prototypes, through: :room_users
- has_many :comments

## prototypes テーブル

| カラム名      | 型          | バリデーション|
| ------       | ------     | ----------- |
| title        | string     | null: false |
| catch-copy   | text       | null: false |
| concept      | text       | null: false |
| user         | references | null: false |

### アソシエーション

- has_many :prototypes_users
- has_many :users, through: :prototypes_users
- has_many :comments

## prototypes_users テーブル

| カラム名     | 型         | バリデーション                   |
| ------     | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| prototypes | references | null: false, foreign_key: true |

### アソシエーション

- belongs_to :prototypes
- belongs_to :user

## comments テーブル

| カラム名   | 型         | バリデーション                   |
| -------  | ---------- | ------------------------------ |
| content  | string     |                                |
| prototype| references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### アソシエーション

- belongs_to :prototypes
- belongs_to :user