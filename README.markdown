Madison Student Apartment Finder: CS 638 Project
================================================

This is the project repository for the project for one of the groups in 
CS 638 at UW-Madison.  Our goal is to make it as easy as possible for 
UW students to find somewhere to live.  The application should be 
easily searchable, simple, and fast.

Members: Adam Eggum, Cory Romdenne, Guilherme Baptista, Matt Wysocki, Justin Smith.

We have turned in our first iteration but can continue working along the way. The latest version of the design document can be found at https://docs.google.com/document/d/1HykZySJCc8YwFjFkzLIKHdVowAAZi1m5WOV4j4tpK2E/edit

Here are some of the gems added to the project:
------------------------------------------------------------
>  + https://github.com/achiu/rack-recaptcha - For re-captcha when making and editing a listing
>
>  + https://github.com/ernie/meta_search - For searching the database for listings
>
>  + https://github.com/mislav/will_paginate - For paging..which was taken out of the search results but does show up for users when signed in.
>
>  + https://github.com/ctran/annotate_models - For development only, annotating the models to make it easier to know what the model is when dealing with the model itself.
> 
>  + https://github.com/stympy/faker - For making 100 users with one command (local only).  I think this might be able to be used for Listings as well.
> 
>  + https://github.com/rspec/rspec-rails - Testing for both unit and some integration tests.  We can obviously still choose to use Cucumber or anything else that we want but this is what I got started with.
> 
>  + https://github.com/thoughtbot/factory_girl_rails - This allows easy creation of anything used with a database for testing.

Testing of the project has gotten started, and to run the test suite that we have use the command 'rspec spec/' or 'rspec spec/any_folder_you_want_to_test/' ... and so on
Some of the tests related to the admin stuff may not be passing right now and I'm not sure if that's because the tests are written incorrectly or if I need to add some stuff to the security.

