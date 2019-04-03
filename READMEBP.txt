-ACCESS-
Local-> $ rails s (localhost:3000)
heroku-> https://eigopost.herokuapp.com
 -$ heroku login
 -$ heroku git:remote -a eigopost
 -$ heroku run rails console

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
