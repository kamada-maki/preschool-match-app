# preschool-match app
## URL
AWS:https://www.preschool-match.tk/
## 概要
保育園を探す保護者と保育園を繋ぐマッチングアプリ

[![Image from Gyazo](https://i.gyazo.com/dcfb9029fcec4296c85d2aac02a8f1c3.jpg)](https://gyazo.com/dcfb9029fcec4296c85d2aac02a8f1c3)

---------------------------------------------

## 開発目的
保育園を今から探す、転園を検討している保護者が多様な預け方、様々な保育園があるという選択肢を知り、
**保育園探しは大変という意識を変えるため。**

---------------------------------------------

## 開発背景
前職が企業で保育園を運営している会社に勤めており、事務管理の仕事をしていた。</br>
各保育園がある自治体とのやりとりや保育園探しをされている保護者の方から話を聞く中で
2016年から始まった企業主導型保育事業や、2019年10月からの保育料無償化により保育園の選択肢が増えたにも関わらず、保育園の増設に比べて待機児童はあまり改善されず、何より保護者も選択肢が増えたと実感しない、**保育園探しは大変、という意識が変わっていない**。</br>
数字を見ても昨年の企業主導型保育園の開設した合計定員数は約60,000人分になるが
平成29年4月の待機児童数26,081人から昨年は16,772人と約10,000人しか減少していないのが現状。</br>またコロナの影響により在宅勤務の方が増え、預け方の多様性も求められるようになり、これまでより更に保護者にとって選択肢が多くあるべきだと思っている。

選択肢が増えていないと感じる理由になる①〜③を解消するために今回のアプリ開発を考えた。</br>
①無償化、企業主導型など新制度の理解が浸透していない
企業主導型は内閣府が主導の制度のため、内閣府のHPを見ないといけない、
一方で保育料無償化は各都道県または市区町村の単位で提出物や基準が異なり、
まとめサイトのようなものがなく、保護者の情報収集に時間がかかってしまう。</br>
②企業主導型保育園の認知が浅い
2016年から全国で開設され、2020年現在では約20,000箇所あるにも関わらず
その保育園の従業員しか預けられないという認識の保護者も多く、選択肢の１つにならない。</br>
③各自治体が掲載している保育園一覧のHPでは自治体が管理している認可保育園がメインになっている。
認可外保育園や児童育成協会が管理をしている企業主導型保育園の情報少なく、
認可保育園の空きがない＝預けるところがないという状況になっている。</br>

---------------------------------------------
## 実装機能
- 一覧表示
  - 検索（エリア検索、運営業種別、キーワード検索）
  [![Image from Gyazo](https://i.gyazo.com/dcfb9029fcec4296c85d2aac02a8f1c3.jpg)](https://gyazo.com/dcfb9029fcec4296c85d2aac02a8f1c3)
- 詳細表示
  - 問い合わせボタンの実装
  （クリックすると運営者のメールへ送信できる）
  - Googleマップで園の位置を表示
- ログイン（保育園側、保護者側）
  - SNS認証
- 投稿（画像投稿可）
- 園情報の修正、削除
- マイページ
- 保育料金シュミレーション機能（預ける時間、年齢を入力すると料金の概算結果が出る）
[![Image from Gyazo](https://i.gyazo.com/474b18597015bfc34dd6fbf7b95bd7fd.gif)](https://gyazo.com/474b18597015bfc34dd6fbf7b95bd7fd)
- ★評価を押す、取り消す
[![Image from Gyazo](https://i.gyazo.com/5b1f1878bc6e54045c8ee9a25bd5ccb2.gif)](https://gyazo.com/5b1f1878bc6e54045c8ee9a25bd5ccb2)
- コメント（口コミ）投稿
- コメント（口コミ）削除
[![Image from Gyazo](https://i.gyazo.com/57d88cdc7a5e2c857137c27c2764391b.gif)](https://gyazo.com/57d88cdc7a5e2c857137c27c2764391b)
### 実装予定機能
- 問い合わせボタンの改良
（希望日を入力して送るのではなく、保育園側が空いている時間をカレンダーで共有でき、
  空き時間を保護者が選択できるもの。またはチャット機能の実装）

---------------------------------------------

## 使用技術・環境
- フロントエンド
HTML/CSS
Javascript

- バックエンド
Ruby 2.6.5
Rails 6.0.0

- コード管理
Git/Github

- インフラ
本番環境:
AWS（EC2,S3,RDB,Docker,ALB,SSL）
開発環境:
Docker/Docker-compose
Mysql

- テスト
Rspec

- 静的解析ツール
Rubocop

</br>

## インフラ構成図
![インフラ構成図](https://user-images.githubusercontent.com/74590047/105568544-95c5de80-5d7d-11eb-8e09-ddfd0dc620ef.png)


## テーブル設計
![テーブル設計図](https://user-images.githubusercontent.com/74590047/105568808-9495b100-5d7f-11eb-8bd0-794723fe2669.png)
### usersテーブル
---------------------------------------------
| Column     | Type         |  Options      |
|------------|--------------|---------------|
| email      | string       | null: false   |
| password   | string       | null: false   |
| nickname   | string       | null: false   |

#### Association
- has_many :comments
- has_many :likes
---------------------------------------------
### commentsテーブル
| column     | Type         |  Options            |
|------------|------------- |---------------------|
|text        |string        | null: false         |
|user        |references    | foreign_key: true   |
|preschool   |references    | foreign_key: true   |
#### Association
- belongs_to :user
- belongs_to :preschool
---------------------------------------------
### adminsテーブル
| column     | Type         |  Options      |
|------------|------------- |---------------|
|email       |string        | null: false   |
|password    |string        | null: false   |
|name        |string        | null: false   |
#### Association
- has_many :preschools
---------------------------------------------
### preschoolsテーブル
| column       | Type         |  Options                     |
|--------------|------------- |------------------------------|
|name          |string        | null: false                  |
|post_number   |string        | null: false                  |
|area_id       |integer       | null: false                  |
|address       |string        | null: false                  |
|building      |string        |                              |
|phone_number  |string        | null: false                  |
|access        |string        | null: false                  |
|open_hour     |time          | null: false                  |
|close_hour    |time          | null: false                  |
|capacity      |integer       | null: false                  |
|category_id   |integer       | null: false                  |
|concept       |string        | null: false                  |
|latitude      |string        | null: false                  |
|longitude     |string        | null: false                  |
|email         |string        | null: false                  |
|admin         |references    | foreign_key: true            |

#### Association
- belongs_to :admin
- has_many :comments
- has_many :likes

---------------------------------------------
### likesテーブル
| column     | Type         |  Options         |
|------------|------------- |------------------|
|user_id     |references    |foreign_key: true | 
|preschool_id|references    |foreign_key: true |
#### Association
- belongs_to :preschool
- belongs_to :user

