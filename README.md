SaralHRM
========

A simple application which can be used to mark the attendance of employees in an organisation using Playframework-Play2


Type of users:

- Admin
- Employees

Admin: Admin can login using user name admin and password m2n1shlko

Manage Employees: CRUD where he can view all the employees and enable/disable their login capability. Admin can add a new employee by entering his name, and email address. An email will be sent to employee on sussfull creation of his account. The email will contain a randomly generated password.

View Report: This page will display the login/logout time of employees. A drop down containing the name of all the employees will be visible at the top. This will be used to filter the report by employee. Report can be filtered by Date as well.

Employees: Employee should be able to login using his email address and the password received in the email.

Mark Attendance: This page will contain a text area where user can enter comments and a button with label "Punch-In". Clicking on this button will maek his "IN" time in database and now the label on the button will say "Punch-Out". Clicking on this button will save the "Out" time in database.

View Report: This page will display the login/logout time of the logged in employee.Report can be filtered by Date.

Sign Up
Sign In
Reset password
shows passwords secured with bcrypt
Shows secure workflow to reset password
Shows secure workflow to reset email
Change email from Settings

Technology used:
Database: postgres sql
Framework: play 2.3.0
Language: JAVA,Scala
Using Typesafe Plugin Mailer : https://github.com/typesafehub/play-plugins/tree/master/mailer
Using Twitter Bootstrap 3 : http://twitter.github.com/bootstrap/
Using Font-Awesome 4 : http://fortawesome.github.io/Font-Awesome/icons/
Using Less and CoffeeScript
Using a password strength checker
