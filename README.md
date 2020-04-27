# README
* Name
QolApp

* Overview
You can measure health-related quality of life and manage subordinate's Qol by using this app.

* Requirement
If you haven't already, you need to install MySQL.
```$ brew install mysql  # Using Homebrew on macOS```

* Getting started

To get started with the app, first clone the repo and cd into the directory:

```$ git clone https://github.com/glut2/qol_app.git```  
```$ cd qol_app```

Then install the needed packages:

```$ bundle install```

Next, migrate the database:

```$ rails db:migrate```

Finally you’ll be ready to seed the database with sample users and run the app in a local server:

```$ rails db:create```  
```$ rails server```
