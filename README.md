# CreateRailsApp

* This is a test regarding review apps and buildpacks

## Annotations in the codebase

* Ref: http://guides.rubyonrails.org/command_line.html#notes
* View annotations in the command line with `rails notes`
* Notes in `rb` files need to be written as `# TODO This is a task`
* Notes in `js` files need to be written as `// TODO This is a task %>`
* Notes in `scss, css` files need to be written as `// TODO This is a task`
* Notes in `erb` files need to be written as `<% TODO This is a task %>`
* You must have `SOURCE_ANNOTATION_DIRECTORIES: "spec"` specified in your environment variables for spec file annotations to be captured.

## Primary Stack

* Rails 5
* installed with `rails new create-rails-app-server --skip-turbolinks --skip-action-cable --skip-test --skip-spring`

## Steps for local development

### Setup Git/Github

### Setup Heroku

First, you'll need to ask to be added as a collaborator to the Heroku projects for access.

Second, you'll need to connect your local git repo to the heroku repos:
* connect to staging: `git remote add staging https://git.heroku.com/create-rails-app-staging.git`
* connect to production: `git remote add production https://git.heroku.com/create-rails-app-production.git`
* review your remotes: `git remote -v`

You should see something like this:
```
origin  https://github.com/wrburgess/create-rails-app.git (fetch)
origin  https://github.com/wrburgess/create-rails-app.git (push)
production  https://git.heroku.com/create-rails-app-production.git (fetch)
production  https://git.heroku.com/create-rails-app-production.git (push)
staging https://git.heroku.com/create-rails-app-staging.git (fetch)
staging https://git.heroku.com/create-rails-app-staging.git (push)
```

### Setup Codebase

### Setup RVM

* Ref: https://gist.github.com/wrburgess/a6fc079cee6f14fc601b1.
* Install with curl: `\curl -sSL https://get.rvm.io | bash -s stable`
* Source RVM: `source /Users/[user]/.rvm/scripts/rvm`
* As a routine process, you may want to update with: `rvm get stable`

### Setup Ruby

* Ref: https://gist.github.com/wrburgess/a6fc079cee6f14fc601b
* Update ruby: `rvm get stable --ruby`
* Confirm ruby version changed: `ruby -v`
* Create `.ruby-version` file in root dir with ruby version number, ex: `2.3.3`

### Setup Rails

* Note: This app utilizes `uuid` data types for all model/table ids.
* Ref: (Rails 5 UUIDs) https://gist.github.com/wrburgess/c1678788181d5f5577c6e84ac5a3efab

### Setup Environment Variables

* Ref: https://github.com/laserlemon/figaro
* Note: We use the figaro gem to store and access env variables out of the reach of source control
* Note: You will need to retrieve the valid variables from a team member and place the contents in the `/config/application.yml` file.

### Setup Foreman

* Ref: https://github.com/ddollar/foreman
* Install: `gem install foreman`
* Note: This will run the `Procfile` and `Procfile.development` instructions
* Note: You can run your processes with `foreman start -f Procfile.development`
* Note: Heroku will utilize the `Procfile` instructions

### Setup Postgres

* We're using Postgres `9.6.1` on production (Heroku) and `9.6.1` in development
* Note: Using a postgres version lower than `9.4.1` will likely break due to `uuid` data type needs for our models
* Download and install from http://postgresapp.com
* You can also install via brew `brew install postgresql`
* `brew services start postgresql`
* `createuser postgres -s`
* Create Local Databases: `rake db:create`

### Setup Redis

* `brew intall redis`
* `brew services start redis`

### Setup Sidekiq

* Ref: https://bryanrite.com/heroku-puma-redis-sidekiq-and-connection-limits/

### Run Servers

* to run the local server type `rails server` or `rails s`
* visit `localhost:3000`

### Understanding Pundit for Authorization

* We use the `pundit` gem for authorization in controllers
* Ref: https://github.com/elabs/pundit
* Ref: https://github.com/chrisalley/pundit-matchers
* Policies are located in `app/policies`
* Specs for policies are located in `spec/policies`

### Setup CircleCi

* Config is setup in the root dir file `circle.yml`

### robots.txt

Ref: http://www.jakobbeyer.de/creating-a-dynamic-robots-txt-for-ruby-on-rails
Note: Changes to the `robots.txt` file can be adjusted in the `/app/views/static/robots.text.erb` file

### Setup RSpec, Capybara, and Selenium

* We use RSpec for unit and feature/integration testing
* Install the ChromeDriver: `brew install chromedriver`
* Run chromedriver with `brew services start chromedriver` for restart or simply `chromedriver`
* Ref: https://www.devmynd.com/blog/setting-up-rspec-and-capybara-in-rails-5-for-testing/

### Deployment

1. Push your branch to GitHub with `git push origin [branch-name]`
1. CircleCi will build the app, run `rspec`, and scan style with `rubocop`.
1. When the `master` branch passes on the CircleCi build, the app will be deployed to the staging server on Heroku
1. The application is hosted on a Heroku Pipeline named [create-rails-app-server](https://dashboard.heroku.com/pipelines/21cb399e-2539-45bf-81f7-d66a1b00bf26)
1. You can promote the staging app to production (`create-rails-app-server-staging` to `create-rails-app-server-production`) via `heroku pipelines:promote -r staging`
1. Post-deploy tasks are referenced in the `Procfile` after the `release:` instruction
1. The deploy tasks are located in the `/lib/tasks/app.rake` file
1. To create a new version tag the last commit with `git tag -d v[semver]` and `git push --tags origin`

## Quality Control

* run Rails tests: `bundle exec rspec spec`
* run Rubocop linting: `rubocop`
* run JavaScript tests: `rake teaspoon` or `teaspoon`
* run JavaScript linting: `npm run lint`

## Security Checks

* run `bundle outdated` > update gems with `bundle update` > run tests
* run `bundle-audit update`
* run `bundle-audit`
* run `brakeman`
* run `hakiri system:steps`
* run `hakiri manifest:generate` > `hakiri system:scan`
* run `hakiri gemfile:scan`

## Security References

* [How Do Ruby/Rails Developers Keep Updated on Security Alerts?](http://gavinmiller.io/2015/staying-up-to-date-with-security-alerts/)
* [Ruby Security Mailing List](https://groups.google.com/forum/#!forum/ruby-security-ann)
* [Rails Security Mailing List](https://groups.google.com/forum/?fromgroups#!forum/rubyonrails-security)
* [CVE Details](https://www.cvedetails.com/)
* [Hakiri service (fee-based)](https://hakiri.io/)
* [AppCanary service (fee-based)](https://appcanary.com/)

## Setting up for Javascript Testing

* make sure you have [Homebrew]() installed
* then `brew install phantomjs` if you do not have phantomjs installed
* run `rake teaspoon` or `teaspoon` and this will run the tests.  You can view the output in the console or visit `ocalhost:3000/teaspoon/default` if you have the rails server running (`rails server` or `rails s`)

## Adding a pre-commit Hook

* you can add a pre-commit hook to make sure that all the tests are passing locally and that the project is up to style standards. It will run every time before you commit code.  I love it and suggest using it.  To do so.....
* from the root of the project go into the `.git/hooks` folder.
* rename it to `pre-commit` (just remove the .sample)
* open the `pre-commit` file
* paste the following into the file...

```sh
#!/bin/sh
set -e

npm run lint
rubocop
npm run build
teaspoon
rspec
```

* your code should not have been commited if there are errors. Go ahead and fix them and give it another go.
* if you want to commit the code anyways, go ahead and run `git commit --no-verify`

# Webpack
  We are using webpack to manage our javascript.
  * make sure you have [Node](https://nodejs.org/en/) installed
  * verify with `node --version`
  * `npm install`
  * kick off the javascript watcher `npm run watch`

## Email System

### Development

We are using [Letter Opener Web](https://github.com/fgrehm/letter_opener_web) which will ease the development of emails. Instead of actually sending the emails, they will be caught and stored at `/tmp/letter_opener`. This way they can be viewed and evaluated. You can view and delete the emails at `http://localhost:3000/letter_opener/`

### Staging

We are using Mailtrap...

### Production

We are using Mandrill...

## Postgres on Heroku

### Upgrading versions

* Ref: https://devcenter.heroku.com/articles/upgrading-heroku-postgres-databases#upgrade-with-pg-upgrade
* Backup your current database through Autobus: https://www.autobus.io/
* OR Backup your current database through Heroku Dashboard: https://data.heroku.com/
* OR Backup your current database through the Heroku CLI: `heroku pg:backups capture DATABASE_URL -r staging`
* Create a copy of the database with a matching plan: `heroku addons:create heroku-postgresql:hobby-dev -r staging`
* Wait for db creation to finish: `heroku pg:wait -r staging`
* Turn on maintenance mode: `heroku maintenance:on -r staging`
* Scale down workers, if necessary: `heroku ps:scale worker=0 -r staging`
* Copy current db to copy db: `heroku pg:copy DATABASE_URL [COPY_DATABASE_URL] --r staging` and confirm (ex: `heroku pg:copy DATABASE_URL HEROKU_POSTGRESQL_AMBER_URL --r staging`)
* Promote copy db to current: `heroku pg:promote [COPY_DATABASE_URL] -r staging` (ex: heroku pg:promote `HEROKU_POSTGRESQL_AMBER_URL -r staging`)
* Turn off maintenance mode: `heroku maintenance:off -r staging`
* Scale up workers, if necessary: `heroku ps:scale worker=1`
* As a quality check, run `heroku pg:info -r staging` to check status. Your current db will utilize the `DATABASE_URL` environment variable
* Backup old database and remove from heroku

