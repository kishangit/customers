# README

Ruby - ruby 2.7.0

Rails - Rails 6.0.3.3

UI - Bootstrap(4.5)

----
Validations:
1) File Validation: If we click without selecting file then it will through alert message.
2) File Validation: If we select any other file which is not csv then it will through alert message and remove selected file.
3) First Name: If first_name column is blank in csv file then that record will not be imported.
4) Email: It should be uniq per customer_id, one user can have many email but customer_id column should be uniq as per description.
5) Phone: It should be uniq per customer_id, one user can have many phone number but customer_id column should be uniq as per description.

----
Clone the repo:
Step 1: bundle install
Step 2: rails db:setup
Step 3: rails s
Step 4: start sidekiq by using command "sidekiq" in terminal
----

Test cases: I have implemented some basic unit tests for validation mentioned in the description.