# 単語帳ガチャ

## App URL

### **http://18.180.14.244/**  

## Description

ユーザーごとに単語を登録し、登録した単語をランダムに取り出し勉強できるアプリです。</br>
ランダムに取り出す数は<b>３、５、１０</b>となっており、その時々に合わせて選択を行なってください。</br>
単語の登録方法は、トップページの登録フォームに単語と意味を記入し登録ボタンを押すだけ！！</br>
また、単語を間違えてしまったり、<b>変更削除</b>を行いたい際は、登録した単語をクリックし、その先のフォームにて行うことができます。</br>
![単語関係](https://user-images.githubusercontent.com/60500667/79390407-989fd180-7faa-11ea-87e4-d9338887a9fa.png)</br>



# DB設計

## usersテーブル

|Colum|Type|Option|
|-----|----|------|
|name|string|null:false,unique:true|
|email|string|null:false,unique:true|
|password|string|null:false|

### Association
- has_many :words


## wordsテーブル
|Colum|Type|Option|
|-----|----|------|
|name|string||
|score|integer||
|rare_id|integer|null:false,foreign_key: true|
|user_id|integer|null:false,foreign_key: true|

### Association
- belong_to :user
- belong_to :rare


## rareテーブル
|Colum|Type|Option|
|-----|----|------|
|rare|string|null:false,unique:true|
|probability|integer|null:false,unique:true|
|word_quantity|integer||

### Association
- has_many :words