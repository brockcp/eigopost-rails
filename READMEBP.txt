-ACCESS-
Local-> $ rails (bash shortcut is 'rails' for rails s). Go to localhost:3000
heroku-> https://eigopost.herokuapp.com
 -$ heroku login
 -$ heroku git:remote -a eigopost
 -$ heroku run rails console

-DB ACCESS-
 -$rails c
 -pry(main)> User.all    //LISTS ALL USERS

-LOCALHOST SIGN IN-
  brockpatterson.../h...h...

-BUILDNOTES/FEATURES-

-POSTGRES db
  -configure db on command line(see notes)
  -create/configure database.yml

 -DEVISE gem for login authentication(email confirmation)
   -error messages here -> config/locales/devise.en.yml
   -SECRET_KEY_BASE in devise.rb and secrets.yml ???
   -couldnt create controller without secret code -> added code to devise.rb

 -SENDGRID gem for email in dev and production
   -passwords in config/application.yml
   -2 separate api keys for dev and production(both send confirm. email)

-ISSUES-
 -signup error bad style ???
 -footer sliding up.

-LOG-
7/14/2018
eigopost wouldnt start, so...
$ bundle install   #UPDATED GEMFILE
$ brew tap homebrew/services   #UPDATED POSTGRES
$ rails s   ---> ERROR: Is the server running locally and accepting...
$ brew services start postgresql  #STARTED POSTGRESQL
$ rails s   --->  ERROR: role "bcp" does not exist
changed database.yml username to brockpatterson and password to \\\\
$ rails s   --->  ERROR: database 'eigopost_db' does not exist
$ psql postgres -U brockpatterson  #SIGNED INTO POSTGRESQL
>postgres=# CREATE DATABASE eigopost_db;
NOTE: postgres=> denotes superUser/ postgres=# denotes regular user
>postgres=# GRANT ALL PRIVILEGES ON DATABASE eigopost_db TO brockpatterson;
>postgres=# \connect eigopost_db   #?
$ rails s   --->  ERROR: pending migrations
$ rake db:migrate
$ rails s   --->  VOILA!!!!

8/25/2019
wouldnt start so...
 -make sure command is correct - via bash shortcut command is 'rails'
 -check to see if/what gemset is selected -> $ rvm list gemsets
 -if necessary, to select gemset, $ rvm use ruby-2.4.1  (current set is ruby-2.4.1)
