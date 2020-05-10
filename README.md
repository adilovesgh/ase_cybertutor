# CyberTutor: An Online Tutoring Platform

<img src="cybertutor_homepage.png"/>

## Team Members
* Aditya Sridhar (as5883)
* Daniel Kang (hk3021)
* Nicholas Bethune (nab2189)

## Project Overview
We create CyberTutor, an online tutoring platform built to connect a large base of tutors with students across the globe and to give anyone with a drive to learn access to experienced, vetted experts in mere moments. Our platform is built using Ruby on Rails, JavaScript, and HTML/CSS frameworks.

We present the overview of our project's primary features and components:

* Login: we implemented a login feature that requires the user to log in to his or her account conventionally via username and password. Using `bcrypt`, we have server-side encrypted passwords for validation. Account info pages are login-protected, and unauthorized attempts at access will result in a redirect. Validation of account details includes checking for valid emails, preventing duplicate account information, and requiring a password with 5 or more characters. 

* Tutoring Session Approval/Rejection: the tutor is able to manage session requests from potential students. We impose the restriction that students cannot automatically sign up for sessions. Before approving a session,a check is done to make sure that the tutor or the student does not have overlapping sessions. All of the times on the website are in UTC, 5 hours ahead of Eastern Time (4 during daylight saving). Please keep this in mind when requesting a new session or looking at the the session schedule.

* Reviewer: reviewers have special permissions to manage tutor eligibility. In other words, website users who wish to be tutors for a specific subject must wait to acquire approval from a reviewer prior to tutorship being granted. Reviewers are normal users who are given the reviewer status by the admins. A reviewer cannot approve his or her own tutor requests. The goal of the reviewer system is to create a self-sustaining pool of tutors, where new users are reviewed and become tutors, and then once a tutor has accrued a significant number of sessions and reviews in a subject, they can become a reviewer. This way, our tutor base is self-replicating and our focus can be on the technological platform.

* Administration: admins have special permissions to grant reviewer eligibility. Admins can grant and take away reviewer status of other users. Currently, the admin account uses the email _aseadmin@aseadmin.com_ and password _aseadmin_. Please use this admin account for approving tutors. The admin account is created simultaneously when the first account is created. In order to access the admin account, please create an account first.

* Payment Gateway Services: we implemented a payment transaction system by which students can pay for sessions by entering credit card credentials. For our gateway services, we integrate Stripe and begin to integrate Paypal in our application. Complete transaction execution occurs prior to the creation of tutoring sessions. We use sandbox environments and test accounts provided by these gateway services to simulate payment transactions. For testing with Stripe, we used the following procedure. Note that to view a successful order in the dashboard, steps 1, 2, and 4 must be customized individually. Otherwise, to test app functionality, please proceed to step 3.
  1. We create a Stripe account and ensure that __View Test Data__ has been toggled on.
  2. We extract the test keys from the Stripe dashboard and add them to `config/application.yml`. Our keys can be found in this file.
  3. When executing a payment transaction in the app, we enter testing card information into the credit card form. Our sample card number is _4242 4242 4242 4242_ (Visa), and we assign the date any future date value. We also assign an arbitrary CVC and ZIP code.
  4. We are able to view that a valid order was successful in the Stripe dashboard.

	For testing with PayPal, we used the following procedure:
	1. We create a PayPal developer account and set up two sandbox accounts: personal (buyer) and business (merchant).
	2. We create an application in the business sandbox, extract the test keys, and add them to `config/application.yml`. Our keys can be found in this file.
	3. After choosing PayPal as the payment method, we enter the credentials for the created buyer account, log in, and confirm the order.
	4. We are able to view that a valid order was successful in the PayPal dashboard.

* Balance: Users can use the payment feature to add balance to their own accounts. The balance can be used for tutoring sessions or can be withdrawn. When tutors complete their sessions, payments are added to the balance. The tutors can then decide if they want to spend the balance earned or withdraw the balance. Currently, the withdraw functionality just subtracts the balance from the account, and the account is not tied to a physical bank account. The balance payments work as follows.
	1. When a student signs up for a tutoring session, the payment is withdrawn from his or her balance.
	2. If the tutor rejects a session or the session request times out, i.e., the instructor does not accept the session before it starts, the money is returned to the student.
	3. If the tutor accepts the tutoring session, the payment gets added to the tutor's balance after the session is completed.

* Live Video Chat: we implemented a video chat feature for tutor-to-student in-browser video calls. This feature enables tutors and students to interact during any tutoring session. Note that you might need to refresh the page if the video does not appear (this message has also been added to the website).

* Chat Messaging: we provide a user-friendly, real-time chat application to allow tutors and students to communicate notes and ideas (or simply to converse).

* Shared Whiteboard: in addition to live video and messaging, we provide tutors and students with a session-specific private whiteboard for interactive tutoring.

* CSS Styling: over the iterations, we have continuously improved our UI to make the website more aesthetic and user-friendly. We have also implemented bootstrap to make the display less cluttered, cleaner, and more organized.

## Setup
If you would like to access CyberTutor locally or make local modifications, please follow the instructions below to set up CyberTutor locally:
1. Clone the repository.
2. Run `bundle install` in the "ase_cybertutor" directory.
3. You will need to have `postgresql` installed. Please install `postgresql` if you haven't done so. To install the latest version of `postgresql` on a Mac, run `brew install postgresql` in the command line and follow the instructions at https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-macos.
4. Make sure that the `postgresql` server is running. The command for doing so is `pg_ctl -D `__{directory to *postgresql*}__` start`. Typically, the command will be `pg_ctl -D /usr/local/var/postgres start`.
5. You will need to perform a database migration. Please run `rake db:create db:migrate db:seed` in the "ase_cybertutor" directory.
6. Run `rails server` while still in the "ase_cybertutor" directory to start the Rails server. You can now access our application in the web browser.

## Sample Tutorial for Session Sign-Up
The following tutorial will demonstrate sign-ups for sessions between tutors and students. A session consists of a room, a timestamp (including date and time), the tutor, and the student. When a student signs up for a session with a tutor, the tutor must first approve or reject the session to avoid potential schedule conflicts. Upon approval, both the student and tutor can access a session-specific room where they will have access to video chat, chat messaging, and a shared whiteboard.   
  1. First, navigate to our website's main page.
  2. Click on _Sign Up_ in the top-right corner.
  3. Create a new account. Note that this will be your tutor account.
  4. You should be on the _My Account_ page. Click on _Subjects you teach_.
  5. Next, click on _Register to tutor a subject_.
  6. Click on _Add new subject_.
  7. Add a subject that you are interested in teaching.
  8. Press _Sign up to tutor __{subject you want to teach}___.
  9. Log out. The logout button is in the top-right corner.
  10. Log in with the username _aseadmin@aseadmin.com_ and password _aseadmin_.
  11. Then, click on _Tutor Requests_ in the navigation bar.
  12. Accept the tutor request from your account.
  13. Log out and create a new account that will represent the student account by following steps 1-3.
  14. You should now be on the _My Account_ page again. Ensure that you have enough balance to register for a session. If you need to add balance, click on _Add Balance_, and complete the transaction using either Stripe or PayPal. If the transaction is successful, you should be redirected back to the _My Account_ page.
  15. Click on _View your sessions_.
  16. Then, at the bottom of the page, click on _Set up a new session to learn_.
  17. You will see a list of subjects. Click on _Tutors for __{the subject you signed up to teach}___.
  18. You will see a list of tutors for the subject. Click on _Sign up for a session with __{the name of the tutor represented by your tutor account}___.
  19. Complete the form. Note that registration times are in UTC. For example, if you want to sign up for 4 PM Eastern Time (EST), you should sign up for 8 PM (possibly 9 PM if not in daylight savings time).
  20. Submit the form.
  21. Log out of the student account, and log in to the tutor account.
  22. Click on _View your sessions_.
  23. Now, you have a choice of approving or rejecting the session request!

## GitHub
The link for our GitHub repository is: https://github.com/adilovesgh/ase_cybertutor.git

## User Stories
The user stories for our application can be found under the "features" directory. The "features/step_definitions" directory contains the Ruby files with Capybara DSL methods for our features. From the "ase_cybertutor" directory, run `bundle exec cucumber features/`__{.feature file}__ for testing a specific user story feature with Cucumber. Run `bundle exec cucumber features` to run all of the user story features.

## Initial Users
Our plan for the accrual of initial users involves a campus-based approach. We reached out to several acquaintances who tutor professionally and discussed the pain points of their client acquisition process. We found that our platform removes or reduces most of them, meaning our main challenge is gaining initial brand awareness. Because colleges have a wealth of both potential students and tutors, we would use our own network to establish a starting point on campus. Then, using initial incentives and advertising in order to appeal to students looking for potential income, we would grow our userbase with our on-platform tutor review system allowing for rapid expansion of our tutoring network.

## Heroku Deployment
Our application has been deployed to Heroku, and the link for the deployed application is: https://intense-oasis-95894.herokuapp.com/

## Project Video/Product Pitch
You can check out our YouTube video, which presents a preview of our platform during its early development: https://youtu.be/R102fB0nV4I. The video details our product pitch, our business model, and our experiences with Agile and software development.
