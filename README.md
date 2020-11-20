# Life_Balance_Wheel

*11/19/2020 is the recent updates to the codebase.*

#### Repository  Life_Balance_Wheel
-----

This repository contains the framework for the blog application. 

To code it I used my skills in HTML, CSS, Ruby on Rails 5, Bootstrap, Testing, SQL, Swagger.

Ruby on Rails 5 Basics, Rails Routes and Resources, and Active Record Associations in Rails.

Idea *

The goal of this project is to bring more clarity to human life and provide helpful materials that 
will fill gaps in important areas of human life. Such as family and friends, finances, career/business, 
intimate relationships, health/sefl-care, spiritual growing, personal development and physical environment.

On this blog application you'll see:

Data Models *

- Four models: Users (registered to attended or choose the activities), Activities (correlated to the each section in Life Balance Wheel), Exercises (wrote for the Activity in Life Balance Wheel), and Sectors (correlated to the each section in Life Balance Wheel).
- Fours assosiation: one-to-many between Users and Activities, many-to-many between Activities and Exercises, has-many-through between Users and Activities through Participation, one-to-many between Users and Sectors.
- Validation of attributes for Users, Activities, Exercises information.
- CRUD operations for models in controllers.
- Views for index, new, edit, and show pages.
- Forms controls, links, css and Bootstrap controls, images, colors, fonts, dropdown, search.
- Rspec for testing some of CRUD operations

Also:

* Security - basic authentification.

My improving plan for this project:

* Call the API using AJAX, from a front end application. 
* Create models for Registration, Sing in, Sing Up.
* Fix issues (Validation for Exercises, background image on jumbotron).

PS: After you clone repository, be sure to run bundle install before you try to bring up the code.

[Website](https://lena-aiu.github.io/ "It's work!")

@lena-aiu :+1: This looks great - it's ready to review! :hibiscus:



