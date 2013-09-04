# San Francisco Food Trucks

This application was built for [Uber's](https://www.uber.com/) coding challenge. It features a map of San Francisco with the locations of various food trucks, using data from [San Francisco Data](https://data.sfgov.org/Permitting/Mobile-Food-Facility-Permit/rqzj-sfat).

## Live demo

You can view a live version of this application at https://san-francisco-food-trucks.herokuapp.com/.

## Software used

* Ruby on Rails
* MongoDB
* Haml
* Sass
* Twitter Bootstrap
* jQuery
* Underscore.js
* Backbone.js
* RSpec
* Konacha (Mocha + Chai)

## Usage

The application displays a map of locations of food trucks in San Francisco. Hovering over a marker shows the name of the truck and clicking on it brings up a window which includes its address and the type of food it sells. To focus the map on a particular address, you can type an address in the search field above the map and hit return.

## Architecture

SFFT uses MongoDB to store records of food trucks. Mongo was chosen because it accurately represents the JSON returned from San Francisco Data's API, including data types. A utility class at `lib/truck_data_fetcher.rb` is used to fetch data from the API and create `Truck` records in MongoDB.

The front end of the application is a single page which bootstraps all the stored `Truck` objects into a Backbone.js application. The Backbone application includes a model and collection for trucks, and two views: one for managing the map of San Francisco, and one for the search field above the map.

The Ruby code is tested with RSpec. Some of the JavaScript code is tested with Mocha and Chai, but not all of it, given time constraints.

## Assumptions

The application assumes users will be using a modern browser, preferably Google Chrome.

## Possible improvements

There are several features and code improvements that would have been nice to have, or that would have been added if this project were to have gone on longer. Some of these include:

* More thorough tests for Backbone objects
* High level integration tests
* Filtering food trucks by type of food sold
* Detecting existing records of the API data fetcher is run more than once
* Caching at the HTTP and data layers

## About the author

**Jimmy Cuadra** is a software engineer living in San Francisco, specializing in Ruby and JavaScript. For an example of a Ruby project, see [Lita](http://lita.io/). For example of a heavier front end project (also using Backbone.js), see [Pushing Hands](https://github.com/jimmycuadra/pushing-hands), a game built for GitHub's 2012 Game Off. Jimmy's blog and résumé are available at http://www.jimmycuadra.com/.
