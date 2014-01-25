
ISS Flyby ![My image](https://api.travis-ci.org/mkbehbehani/issflyby.png)
========

**Sends notifications to users' Google Glass shortly before the ISS is visible overhead.**

View at www.issflyby.com

International Space Station flyby notifier for Google Glass

Rails, Mirror API

Collaboration:
We love pull requests! This is open-source, MIT license. We're making this out of love for beautiful internet things. Jump right in by completing TODOs in the source!

Summary:

- Upon signin, users' Google Glass locations are recorded and Pass objects are created for each time the ISS will fly over illuminated by the sun.
- Every ten minutes passes are checked to see one is coming up, and a notification is sent for any that are.
- Every hour, users' locations are checked for change. If a user's location has deviated more than 10km, the Passes are destroyed and recalculated for that user.