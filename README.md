# MediWallet

Here's a [link](www.mediwallet.io) to the live site. Got a question? [Email](mailto:ryan.yep@gmail.com) me.

## Introduction

MediWallet is an application which allows a user to store their important healthcare information online.

## Description

MediWallet's goal is to help users have all their important healthcare information in one centralized place. With all the changes in healthcare today as well as being a highly mobilized society, it is common for many to not have an established relationship with a primary care physician or they see a different doctor each year. Having important information such as your medical history in one place allows you to share it with a physician to help them make smarter decisions.

MediWallet is on Ruby on Rails with a Postgresql database and hosted on Heroku.

## Installation
* Fork this repo
* Clone this repo
* Run `bundle install`
* Run `rake db:create`
* Install Figaro and place API keys in appropriate files

## Libraries and Technologies
* Ruby 2.2.1
* Rails 4.2.4
* [Devise](https://github.com/plataformatec/devise) (authentication)
* [paper_trail 4.0.0](https://github.com/airblade/paper_trail) (versioning / auditing)
* [Figaro](https://github.com/laserlemon/figaro) (secure API keys)
* [Twilio](https://github.com/twilio/twilio-ruby) (SMS reminders)
* [Chartkick](https://github.com/ankane/chartkick) (for graphs)
* [Materialize](http://materializecss.com/) (responsive front-end framework)

## UMLs & Wireframes
![](https://dl.dropboxusercontent.com/u/17178250/MediWallet_UMLs.png)

* [Home Page](https://dl.dropboxusercontent.com/u/17178250/HealthDocs/HealthDocs%20-%20Home%20Page.png)
* [About Page](https://dl.dropboxusercontent.com/u/17178250/HealthDocs/HealthDocs%20-%20About%20Page.png)
* [Login Page](https://dl.dropboxusercontent.com/u/17178250/HealthDocs/HealthDocs%20-%20Login%20Page.png)
* [Create Account Page](https://dl.dropboxusercontent.com/u/17178250/HealthDocs/HealthDocs%20-%20Create%20an%20Account%20Page.png)
* [Benefit Info Page](https://dl.dropboxusercontent.com/u/17178250/HealthDocs/HealthDocs%20-%20Benefit%20Info%20Page.png)
* [User Dashboard](https://dl.dropboxusercontent.com/u/17178250/HealthDocs/HealthDocs%20-%20User%20Dashboard.png)
* [Electronic Health Record Page](https://dl.dropboxusercontent.com/u/17178250/HealthDocs/HealthDocs%20-%20EHR%20Page.png)
* [Health Data Page](https://dl.dropboxusercontent.com/u/17178250/HealthDocs/HealthDocs%20-%20Health%20Data%20Page.png)

## Trello Board
[Link](https://trello.com/b/vUhu2fYu/mediwallet)