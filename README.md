# CyberTutor: An Online Tutoring Platform (Iteration 2)

## Team Members
* Aditya Sridhar (as5883)
* Daniel Kang (hk3021)
* Nicholas Bethune (nab2189)

## Iteration 2 Updates
We present the following list of updates from Iteration 2 as improvements or extensions of Iteration 1 features:

* Log-In Feature: we implemented a log-in feature that requires the user to log in to his or her account using a username and password. Using bcrypt, we have server-side encrypted passwords for validation. Account info pages are login-protected and unauthorized attempts at access will result in a redirect. Validation of account details includes checking for valid email, preventing duplicate account information and requiring a password with 5 or more characters. 

* Tutoring Session Approval/Rejection: the tutor is able to manage session requests from potential students. We impose the restriction that students are no longer able to automatically sign up for sessions.

* Payment Gateway Services: we implemented a payment transaction system by which students can pay for sessions by entering credit card credentials. For our gateway services, we integrate Stripe and begin to integrate Paypal in our application. Complete transaction execution occurs prior to the creation of tutoring sessions. We use sandbox environments and test accounts provided by these gateway services to simulate payment transactions. Other than basic UI elements, the implementation for PayPal is incomplete; however, similar to Stripe, PayPal can easily be integrated into our current application and will be an objective for the final iteration. For testing with Stripe, we used the following procedure. Note that to view a successful order in the dashboard, steps 1, 2, and 4 must be customized individually. Otherwise, to test app functionality, please proceed to step 3.
  1. We create an account in Stripe and ensure that __View Test Data__ has been toggled on.
  2. We extract the test keys from the Stripe dashboard and add them to `config/application.yml`. Our keys can be found in this file.
  3. When executing a payment transaction in the app, we enter testing card information into the credit card form. Our sample card number is _4242 4242 4242 4242_ (Visa), and we assign the date any future date value. We also assign an arbitrary CVC and ZIP code.
  4. We are able to view that a valid order was successful in the Stripe dashboard.

* Live Video Chat: we implemented a video call feature for tutor-to-student in-browser video calls. This feature enables tutors and students to interact during any tutoring session. The feature is still relatively primitive and can be integrated with whiteboard and chat messaging features, which are part of our objectives for the final iteration. Note that you might need to refresh the page if the video does not appear. This message has also been added to the website.

* CSS Styling: in comparison to Iteration 1, for which the CSS styling was relatively primitive, we implemented additional CSS styling to make the website more aesthetic. We also implemented bootstrap to make the display less cluttered, cleaner, and more organized. We will focus on other styling elements in the final iteration.

## GitHub
The link for our GitHub repository is: https://github.com/adilovesgh/ase_cybertutor.git

## User Stories
The user stories for our application can be found under the "features" directory. The "features/step_definitions" directory contains the Ruby files with Capybara DSL methods for our features. From the "ase_cybertutor" directory, run "bundle exec cucumber features/__{.feature file}__" for testing a specific user story feature with Cucumber. Run `bundle exec cucumber features` to run all of the user story features.

Currently, we have temporarily run into a issue with regard to interacting Cucumber tests with the payment transaction outlet that we implemented in Iteration 2. Therefore, our `sessions.feature`, `approve_sessions.feature`, and `video_chat.feature` features have a few steps that have been deliberately skipped. To the best of our knowledge, the transaction system functions properly when tested manually, and we anticipate that the entire Cucumber test suite will be fully functional once we determine how to successfully apply Cucumber to our transaction feature.

## Heroku Deployment
Our application has been deployed to Heroku, and the link for the deployed application is: https://mysterious-waters-80602.herokuapp.com/
