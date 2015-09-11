# Happy blogging

## Description

Blog service built with Ruby on Rails that supports Markdown and features modules to import content from other platforms (currently Medium and Flickr). User can choose between the default and two other themes. 

Final project for the Web Development bootcamp at Ironhack.

[Check it live](http://happyblogging.herokuapp.com/) (click on _Fill in as a guest_ to sign in without having to sign up).

Rails version: 4.2.3

Keywords: Ruby on Rails, PostgreSQL, Puma

## Challenges

### Database

Users have blog items, a general entity that has a specific item (of one of the different types: local post, photo from flickr, post from medium). This is acomplished with a polymorphic association. Users also have a medium detail and a flickr detail, that store data related to that platform. Lastly, blog items have many tags and many comments.

![Database diagram](/app/assets/images/schema.png)

### Get content from external sources

There is a service for each external source that deals with getting the information and passing it to its correspondent item model that processes that data.

* **Medium**: with [medium-scrapper](https://github.com/uesteibar/medium-gem) gem, that gets the title, subtitle, content and URL of every post of a given user (by username).

* **Flickr**: with [faraday](https://github.com/lostisland/faraday) gem and [Flickr API](https://www.flickr.com/services/api/), that provides methods to get the Flickr ID and all the parameters needed to create URLs to both display and link to images of a given user (by username).

### Provide custom styles

The default styles use Sass partials, one of which is in charge to store variables (colors and font families). Optional sets of styles are organised in folders with its own partials that overwrite variables and statements where these are used.

Optional styles (fonts and files) are precompiled as additional assets and loaded conditionally, based on the blog owner choice and just in the views that have certain instance variable available. Turbolinks were removed.

## Run it

* Clone repo `git clone https://github.com/unamaria/happyblogging.git` (or copy files / download zip)
* Install dependencies `bundle install`
* Run migrations `rake db:migrate`
* Run server `rails s`
* Seed database `rake db:seed`
* Run tests `rspec`
* Access app on browser `http://localhost:3000/`