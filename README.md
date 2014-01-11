![My image](https://github.com/mkbehbehani/issflyby/tree/master/app/assets/images/flyby.jpg)
ISS Flyby
========

ISS flyby notifier for Google Glass

Rails, Mirror API

Jump right in by completing TODOs in the source.

Summary:

- Upon signin, users' Glass locations are recorded and Pass objects are created for each time the ISS will fly over. Two NotificationJobs are scheduled for each Pass, one ten minutes before the pass begins and one right as the pass is beginning.
- Every hour, /lib/tasks/check_user_locations.rake compares users' locations to the location for which the Passes were calculated. If a user's location has deviated more than 10km, the Passes are destroyed and recalculated for that user.