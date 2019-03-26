# ruby_travel_bucket_list

**Overview:**

This is a solo project that I did as part of CodeClan course. The app uses Sinatra framework and is built using OOP principles and structured in MVC pattern. The app lets you add cities and countries that you have on your bucket list. Entries are saved to a database. Items can be marked as "visited" or "yet to visit". There is also a simple search functionality, which allows searching by city/country.

**Setup:**

First install ruby, postgresql (follow the official documentation)

Install sinatra and create db:
```
gem install sinatra
createdb travel
```

Create schema and seed it with a few entries:
```
psql -d travel -f db/travel.sql 
ruby db/seed.rb
```

Run the app:
```
ruby main_controller
```
http://localhost:4567

