
ISS Flyby ![My image](https://api.travis-ci.org/mkbehbehani/issflyby.png)
========

**Sends notifications to users' Google Glass shortly before the ISS is visible overhead.**

Live at www.issflyby.com

[![tip for next commit](http://tip4commit.com/projects/348.svg)](http://tip4commit.com/projects/348)

Developer setup
---------------------

- Before signing in, run 'rake db:seed' to obtain the reference ISS row in spacecrafts
- Before signing in, create a Google Cloud Console Mirror API app with webapp credentials permitting this endpoint: http://localhost:3000/auth/google_oauth2/callback

Summary
---------------------

- Upon signin, users' Google Glass locations are recorded and Pass objects are created for each time the ISS will fly over illuminated by the sun.
- Every ten minutes passes are checked to see one is coming up, and a notification is sent for any that are.
- Every hour, users' locations are checked for change. If a user's location has deviated more than 10km, the Passes are destroyed and recalculated for that user.