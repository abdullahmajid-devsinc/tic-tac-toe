# Tic Tac Toe

## Assumptions
* It is a two player game
* Both player will play on the same machine

## Technology stack
* Ruby 2.6.3 (bundler v2)
* Ruby on Rails 6.1.x
* PostgreSQL 13.6
* React 17

## Setting up the development environment
1.  Get the code. Clone this git repository and check out the latest release:
```bash
git clone https://github.com/abdullahmajid-devsinc/tic-tac-toe.git
cd tic-tac-toe
```

### Backend Setup
1. Go to `backend` directory of the project
2.  Install the required gems by running the following command:
```bash
bundle install
```
3.  Create an `environment_variables.yml` file in `backend/config` directory
4.  Add your database configuration details to `environment_variables.yml`. You only need to fill in your progres user name and password.
```bash
DB_USER: "postgres"
DB_PASSWORD: "postgres"
```
5.  Setup database:
```bash
rails db:setup
```
6.  Run server:
`rails server` or `rails s`

### Frontend Setup
1. Go to `frontend` directory of the project
2.  Install the required npm packages by running the following command:
```bash
npm install
```
3.  Run frontend server:
```bash
npm start
```
