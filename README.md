# Server for Resultados Digitais Test
Test for Resultados Digitais

This project runs on Ruby 2.2.4 and Rails 4.2.6
It uses PostgreSQL Database.

In order to run this project locally:
* You'll need a `.env` file with the following entries:
* `RDS_USERNAME` for the DB User;
* `RDS_PASSWORD` for the DB User's password;
* `RDS_DB_NAME` for the DB name;
* `RDS_HOSTNAME` for the DB address;
* `RDS_PORT` for the DB port;
* `LOGENTRIES_KEY` for logging purposes;

After setting up the `.env` file in the main directory, all that's left is:
* `bundle exec bundle install` to have all the GEM files installed;
* `bundle exec rake db:create db:migrate` to set up the DB;
* `bundle exec rails console` to run the local console;
* `ApiKey.create!` to create a new API Key in the local server so the Client application can access via `COOKIE_API_KEY`;
* `bundle exec rails server` to run the local server.

The value for the `COOKIE_ENDPOINT` entry in the Client application should be `http://localhost:3000/visitors` for this server.
