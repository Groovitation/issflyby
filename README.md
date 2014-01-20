![My image](https://raw2.github.com/mkbehbehani/issflyby/master/app/assets/images/flyby.jpg)
ISS Flyby
========

**Sends notifications to users' Google Glass shortly before the ISS is visible overhead.**

live at issflyby.herokuapp.com

International Space Station flyby notifier for Google Glass

Rails, Mirror API

Jump right in by completing TODOs in the source.

Summary:

- Upon signin, users' Glass locations are recorded and Pass objects are created for each time the ISS will fly over illuminated by the sun.
- Every ten minutes passes are checked to see one is coming up, and a notification is sent for any that are.
- Every hour, users' locations are checked for change. If a user's location has deviated more than 10km, the Passes are destroyed and recalculated for that user.