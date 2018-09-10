# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - Sinatra was used to build this application
- [x] Use ActiveRecord for storing information in a database - Active Record was used for storing all my data.
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)- 3 model classes were used Manager, Sanction and Resident
- [x] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts)- Manager class has_many Residents
- [x] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User) Each Resident belongs_to a Manager and each Sanction belongs_to a Resident.
- [x] Include user accounts - Managers must create user accounts.
- [x] Ensure that users can't modify content created by other users - A resident must belong to a Manager for that Manager to add/remove sanctions or discharge.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Residents can be added or discharged and sanctions can be added or removed.
- [x] Include user input validations - a user must be signed in to access residents and make changes.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) - error message appears in layout if user attempts to go past the login page without logging in.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - Readme is complete with all required information.

Confirm
- [x] You have a large number of small Git commits - Committed very often because sometimes the IDE loses connection.
- [x] Your commit messages are meaningful- All commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message - Commit changes are relevant to message.
- [x] You don't include changes in a commit that aren't related to the commit message. -  All changes were included in each commit.
