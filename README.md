# CyberTutor: An Online Tutoring Platform Iteration 2

## Team Members
* Aditya Sridhar (as5883)
* Daniel Kang (hk3021)
* Nicholas Bethune (nb2189)

## Updates from iteration 1
Log in feature - we implemented a log in feature that requires the user to log in to his or her account using a username and password.

Approve/Reject sessions - the tutor is able to screen out session requests. The students are no longer able to automatically sign up for sessions. 

CSS - we implemented some css to make the website more visually pleasing. We also implemented bootstrap to make the display more neat and organized. 

Credit Card - we implemented a credit card feature where the users can pay for sessions by including a credit card. A sample card number you can use is : "4242 4242 4242 4242" with any month/date past the current date and any CVC and ZIP. Currently, we were unable to complete the paypal function. The UI is there, but does not work.

Video call - we implemented a video call feature so that the tutor and the student can video chat during the tutoring session. Still trivial so a lot of features need to be added. When you get to the video chat route, refresh the page. 

## GitHub
The link for our GitHub repository is: https://github.com/adilovesgh/ase_cybertutor.git

## User Stories
The user stories for our application can be found under the "features" directory. The "features/step_definitions" directory contains the Ruby files with Capybara DSL methods for our features. From the "ase_cybertutor" directory, run "bundle exec cucumber features/__{.feature file}__" for testing a specific user story feature with Cucumber. Run "bundle exec cucumber features" to run all of the user story features.

We ran into an issue trying to interact cucumber with credit card transaction extension that we implemented therefore, our sessions.feature, approve_sessions.feature, and video_chat.feature have couple steps that are skipped. It works fine when done manually, however, and we predict the entire Cucumber testing will work fine as soon as we can figure out how to successfully do a test credit card transaction on cucumber.

## Heroku Deployment
Our application has been deployed to Heroku, and the link for the deployed application is: https://mysterious-waters-80602.herokuapp.com/
