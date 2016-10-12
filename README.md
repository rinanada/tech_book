<!-- #モデル名

##アソシエーション
 -アソシエーションの記述
 -アソシエーションの記述

##テーブル名

- 型 :カラム名
- 型 :カラム名

###各ページ
- 各ページについて補足説明、上から順に優先度高め
 -->

# User
---
## association

- has_many :posts
- has_many :reviews
- has_many :likes
- has_many :buyings
- has_many :messages

## table

- string :lastname
- string :firstname
- text :pro_img
- text :image_cache
- text :introduction
- integer :callnumber
- text :address
- integer :postal_code


<!-- usersコントローラー→ログイン周り、ユーザー紹介・詳細画面、購入 -->

# Post
---
## association

- belongs_to :user
- belongs_to :category
- has_one :captureimages
- has_many :reviews
- has_many :buyings

## table

- string :title
- string :sub_title
- integer :price
- integer :state
- integer :user_id
- integer :category_id

<!-- +price消費税 -->
<!-- stateで本の 可/良い/非常に良い/ほぼ新品 enum -->
<!-- postsコントローラー→出品(if user sign inで) -->

# CaptureImage
---
## association

- belongs_to :post

## table

- integer :post_id
- text :content

#Buying
---
## association

- belongs_to :post
- belongs_to :user


## table

- integer :post_id
- integer :user_id

#Category
---

## association
- has_many :post

## table
- integer :langage
- integer :design
- integer :other

<!-- 後々大区分、小区分と分けられたら...STI  -->


# Like
-
## association

- belongs_to :user

## table

- integer :user_id


# Review
-
## association

- belongs_to :post
- belongs_to :user

## table

- text :review_text
- integer :user_id
- integer :post_id

# Message
-
## association

- belongs_to :user

## table

- text :body


<!-- #ページごとの機能、（上から順に優先度高め）

###トップページ

~~ユーザーセッション~~
~~フラッシュメッセージ~~
- お問い合わせメール
- Ransackで検索機能（全文検索、単語検索）
- facebook認証（omniauth）
- twitter認証機能
- 新着図書...図書自体にお気に入りや星での評価はなし、メインタイトルとレビュー数と値段は載せたい
- 検索結果ページネーション。２０件ほどで。その際ビューで「x件中yからz件目を表示」と。
- 住所の郵便番号登録で都道府県が出る
- パスワード再通知メッセージ
- 最初にユーザーを集めるために「登録してから三ヶ月は手数料無料」などど公告
- メッセージ機能でSTI→ 一般メッセージ、お問い合わせ、招待メッセージ、メール認証etc...


###user profile画面

~~ユーザーマイページの登録情報（パスワード）の編集もメール認証に~~
~~購入履歴~~
- followはオンオフをenumで,もしくは出品のお気に入りユーザー登録をlikes_count

- 出品者の使用言語やスキルを表示
- 出品履歴
- メール、電話番号、住所などは公開範囲設定
- tech book score...本の紹介文に誤りのない信用できる出品者であるか、お気に入りがよくされているか、幅広い言語を扱っているか、などを点数つけてくれるとか。


### 購入画面

~~購入後トップページにsold out~~
- 購入された商品は買えないように
- 銀行手続き、メール
- クレジット、コンビニ


###購入完了画面
~~お届け先詳細、マイページへのリンク~~


###商品詳細画面

- お問い合わせ
- 関連書籍
- 画面を小さくすると商品画像のデザインが崩れるのを修正
- カートに入れる機能
- 買いたい側のreview
- reviewでポリモーフィック関連で、answersとquestion

###検索結果


###管理画面

~~active admin~~
- 余裕があったら綺麗なビューも欲しい

 -->

