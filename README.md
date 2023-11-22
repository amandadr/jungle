# Jungle

Welcome to the Jungle!

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example from this boilerplate: https://github.com/lighthouse-labs/jungle-rails/

## My Contributions
As a fresh dev on the Jungle app team I was asked to implement the following features during my onboarding week:
- A sold out badge for products with no stock quantity, which disables add to cart
- An active sale banner which displays on every page
- Appropriate empty cart page
- Order details page (display a completed order)
- User authentication: handle register, login, and guest capabilities; hash password and add validations for inputs
- Admin security using HTTP authentication
- Admin capability to create new categories; refactor admin controllers to inherit from Admin::BaseController
- Automated testing: setup product and user model specs using RSpec; and test the home, product details, and cart pages using Cypress integration.

## Features and Screenshots
### Homepage + Product Details
<img src="https://github.com/amandadr/jungle/blob/master/docs/homepage-product.gif?raw=true" width="750" height="auto"/>

### Cart + Order 
<img src="https://github.com/amandadr/jungle/blob/master/docs/homepage-product.gif?raw=true" width="750" height="auto"/>

### Admin Dashboard + Admin Categories
<img src="https://github.com/amandadr/jungle/blob/master/docs/homepage-product.gif?raw=true" width="750" height="auto"/>

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create `.env file` based on `.env.example`
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
