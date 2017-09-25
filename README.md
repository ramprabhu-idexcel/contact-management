# Contact Management
Build an application to store user's contact number, email and postal address
### Requirements
```
* Implement the template file into new rails project
* Recommend using a MySQL database in a Docker container - compose file included
* Generate the following functionality for a miniature phone book into the rails project
* Create individual tables that contain the contacts name, postal addresses and phone numbers
* Each contact can have multiple addresses and phone numbers
* Index view will list all contact names
* Show view will list details on the contact
* We need the ability to create, edit and delete contacts
* Include validations on the data created on the forms
* Create sample data to pre-populate your tables
* Create a simple rspec test for one of your models
```
### Pre-requisites
```sh
Make sure that you have following libraries and database in your system,
$ ruby 2.3.1
$ rails 5.1.4
$ node 7.6.0

```
```
$ MySQL Docker
$ MySQL DB
```
### Application Setup

```sh
Go to root path of your application and run below commands
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
```
### Rspec
```sh
Below command to run rspec test cases,
$ rspec .
```
### Author

* **Ramprabu Narayanasamy** - [Ramprabu](https://ramprabu.wordpress.com/author/ramprabu/)

### License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

### Acknowledgments
* Hat tip to anyone who's code was used
* Inspiration
* etc