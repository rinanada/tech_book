<!-- #モデル名

##アソシエーション
 -アソシエーションの記述
 -アソシエーションの記述

##テーブル名

- 型 :カラム名
- 型 :カラム名

###各ページ
####各ページについて補足説明、上から順に優先度高め
 -->

# User
---
## association

- has_many :exibits
- has_many :reviews
- has_many :likes

## table

- string :lastname
- string :firstname
- text :pro_img
- text :image_cache
- text :introduction
- integer :callnumber
- text :address
- integer :postal_code



# Exibit
---
## association

- belongs_to :user
- belongs_to :category
- has_one :captureimages
- has_many :reviews

## table

- string :title
- string :sub_title
- integer :price
- integer :state
- integer :user_id
- integer :category_id

<!-- +price消費税 -->
<!-- stateで本の 可/良い/非常に良い/ほぼ新品 enum -->


# CaptureImage
---
## association

- has_one :exibit

## table

- integer :exibit_id
- text :content

#Category
---

## association
- has_many :exibits

## table
- integer :design
- integer :langage
- integer :other

<!-- 後々大区分、小区分と分けられたら。 -->


# Like
-
## association

- belongs_to :user

## table

- integer :user_id


# Review
-
## association

- belongs_to :exibit
- belongs_to :user

## table

- text :review_text
- integer :user_id
- integer :exibit_id




###トップページ

####必須...ユーザーセッション
####新着図書...図書自体にお気に入りや星での評価はなし、メインタイトルとレビュー数と値段は載せたい
####モーダルでユーザー周りをやれば元のデザインに支障ないのかなぁ
####twitter,facebook認証機能OmniAuth
####最初にユーザーを集めるために「登録してから三ヶ月は手数料無料」などど公告



###user profile画面

#### 必須...lastname, firstname, pro_img, introduction, email, callnumber, address,  postal_code
#### followはオンオフをenumで,もしくは出品のお気に入りユーザー登録をlikes_count
#### 出品者の使用言語やスキルを表示
#### 購入履歴、出品履歴
#### メール、電話番号、住所などは公開範囲設定
#### tech book score...本の紹介文に誤りのない信用できる出品者であるか、お気に入りがよくされているか、幅広い言語を扱っているか、などを点数つけてくれるとか。


###購入画面

####銀行手続き、メール
####


###出品画面

####買いたい側のreview
####カートに入れる機能


###管理画面

####rails admin



