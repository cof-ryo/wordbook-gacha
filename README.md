# 単語帳ガチャ

## App URL

### **http://18.180.14.244/**  

## Description

ユーザーごとに単語を登録し、登録した単語をランダムに取り出し勉強できるアプリです。
ランダムに取り出す数は３、５、１０となっており、その時々に合わせて選択を行なってください。
単語の登録方法は
![登録](https://user-images.githubusercontent.com/60500667/79388496-67be9d00-7fa8-11ea-8838-52f9526454ee.png)
に単語と意味を記入し登録ボタンを押すだけ！！
単語を間違えてしまったり、変更削除を行いたい際は、登録した単語をクリックし、その先のフォームにて行うことができます。
![削除編集](https://user-images.githubusercontent.com/60500667/79389535-76598400-7fa9-11ea-9da2-8db3e5b6d753.png)


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