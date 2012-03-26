# Madison Student Apartment Finder: CS 638 Project

This is the project repository for the project for one of the groups in 
CS 638 at UW-Madison.  Our goal is to make it as easy as possible for 
UW students to find somewhere to live.  The application should be 
easily searchable, simple, and fast.

Members: Adam Eggum, Cory Romdenne, Guilherme Baptista, Matt Wysocki, Justin Smith.

We have turned in our first iteration but can continue working along the way. The latest version of the design document can be found at https://docs.google.com/document/d/1HykZySJCc8YwFjFkzLIKHdVowAAZi1m5WOV4j4tpK2E/edit

Here are some of the gems that we are using for the project:
  https://github.com/achiu/rack-recaptcha    - For re-captcha when making and editing a listing
  https://github.com/ernie/meta_search       - For searching the database for listings
  https://github.com/mislav/will_paginate    - For paging..but I took this out last night because it made searching obsolete for some reason. May look into that sometime again soon.

I learned how to set up the heroku database with a simple command (assuming you have heroku access).
It is 'heroku run rake db:migrate --app msaf'. This should do the same as a regular rake on the development environment, I believe.
