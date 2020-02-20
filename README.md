# README

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

* ...


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