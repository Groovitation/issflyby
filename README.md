
ISS Flyby ![My image](https://api.travis-ci.org/mkbehbehani/issflyby.png)
========

**Sends notifications to users' Google Glass shortly before the ISS is visible overhead.**

Live at www.issflyby.com

[![tip for next commit](http://tip4commit.com/projects/348.svg)](http://tip4commit.com/projects/348)

Developer setup
---------------------

- Before signing in, run 'rake db:seed' to obtain the reference ISS row in spacecrafts
- Before signing in, create a Google Cloud Console Mirror API app with webapp credentials permitting this endpoint: http://localhost:3000/auth/google_oauth2/callback. Put credentials in config/application.yml per Figaro gem.