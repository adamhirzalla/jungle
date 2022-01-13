<!-- TITLE -->
<div align="center">
<h1>Jungle</h1>
<img src="docs/images/jungle.jpeg" width=100 alt="logo" />
<p>A mini Rails e-commerce application</p>

<p>Built with <a href="http://rubyonrails.org/">Rails 4.2</a>, 
<a href="https://www.postgresql.org/">PostgreSQL</a>, 
<a href="https://bootstrapdocs.com/v3.3.6/docs/getting-started/">Bootstrap</a> and CSS/
<a href="https://sass-lang.com/">Sass</a>
</div>

<!-- INTRODUCTION -->

## 📚 Introduction

<b>Jungle</b> is a mini e-commerce application built for the purpose of learning Rails by example.

<b><p>Built with <a href="http://rubyonrails.org/">Rails 4.2</a>,
<a href="https://www.postgresql.org/">PostgreSQL</a>,
<a href="https://bootstrapdocs.com/v3.3.6/docs/getting-started/">Bootstrap</a> and CSS/
<a href="https://sass-lang.com/">Sass</a>. Tested using
<a href="https://rspec.info/">RSpec</a>,
<a href="https://github.com/teamcapybara/capybara">Capybara</a> (
<a href="https://github.com/teampoltergeist/poltergeist">Poltergeist</a>,
<a href="https://phantomjs.org/">PhantomJS</a>).
</b>

<!-- INSTALLATION -->

## ✨ Contributions

The idea behind this project was to inherit a partially-completed project and fix existing bugs, add new features, pages, and test different functionalities.

### 🐛 Bugs Fixed

- Empty cart checkout
- Adding an out-of-stock item to cart
- Price formatting (humanized money formatting and leading '$' signs)

### ✅ Features Added

- Shop-wide sales that offer periodic discount on products
- "Sold Out" badge for products that are out of stock
- Basic http-athentication for Admin features
- Admin dashboard which offers viewing/adding new categories/sales
- User authentication for login/signup through bcrypt
- Order details to to view product summary after payment

### 🧪 RSpec Testing

- Models:

  - User
  - Product
  - Category

- Features - _Capybara (Poltergeist/PhantomJS)_:
  - User login
  - Add-to-cart
  - Product details page
  - Home page

## 📷 Screenshots

<img src="docs/screenshots/home.png" alt="home">
<img src="docs/screenshots/login.png" alt="login">
<img src="docs/screenshots/payment.png" alt="payment">
<img src="docs/screenshots/order.png" alt="order">
<img src="docs/screenshots/admin-dashboard.png" alt="dashboard">
<img src="docs/screenshots/admin-sales.png" alt="sales">
<img src="docs/screenshots/admin-category.png" alt="admin-category">
<img src="docs/screenshots/category-show.png" alt="category-show">

## 🛠 Installation

1. Clone or download this repository
   ```
   git clone https://github.com/adamhirzalla/jungle
   ```
2. Navigate to the project directory and install dependencies
   ```
   cd jungle-rails && bundle
   ```
3. Create `config/database.yml`
   ```
   cp config/database.example.yml config/database.yml
   ```
4. Create `config/secrets.yml`
   ```
   cp config/secrets.example.yml config/secrets.yml
   ```
5. Create, load, and seed the database
   ```
   bin/rake db:reset
   ```
6. Sign up for a Stripe account
   - https://stripe.com/en-ca
7. Create `.env` and update with your own Stripe & admin info
   ```
   cp .env.example .env
   ```
8. Launch the development web server
   ```
   bin/rails s -b 0.0.0.0
   ```
9. Visit <a href="http://localhost:3000/">http://localhost:3000/</a> on your browser

## 🧪 Testing (RSpec, Stripe)

1. Run BDD tests (RSpec)
   ```
   rspec
   ```
2. Manually test Stripe checkout scenarios using the following info:

   ```
   # Card number
   4242 4242 4242 4242

   # Expiration date (or any future date)
   05/33

   # CVC (any 3 numbers)
   123
   ```

   - Check out the Stripe docs for more info: <https://stripe.com/docs/testing#cards>

## 🧾 Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
