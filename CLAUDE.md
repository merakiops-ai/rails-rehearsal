# Bookshelf — rules for Claude Code

Practice app. The person using this is not a developer: explain in plain English, keep changes small,
and never merge or deploy. A developer reviews every pull request.

## How the app is built
- Back end: Ruby on Rails 8 (`app/models`, `app/controllers`), PostgreSQL database.
- API: GraphQL (graphql-ruby). Types in `app/graphql/types`, the entry point is `app/graphql/types/query_type.rb`.
- Front end: React, built with Vite, in `app/frontend`. Data comes from Apollo `useQuery` calls in the components.
- Background jobs: Sidekiq on Redis, in `app/jobs`.
- Tests: RSpec in `spec/`.

## A typical change
Showing a new field on the page = add it to the GraphQL type, add it to the Apollo query, show it in the
React component, add or update a test. If the field doesn't exist in the database yet, stop and say so:
database changes need developer sign-off.

## Rules
- One change per branch and per pull request. Branch name: `change/<short-description>`.
- Before opening a pull request: run `bundle exec rspec` and confirm it passes; open the page and check it.
- Ask before touching anything in: `db/migrate`, `db/schema.rb`, `config/`, `Gemfile`, `package.json`,
  logins/permissions, payments, or anything that sends email or calls a paid API. Say why it needs a developer.
- Never push to `main`, never merge, never force-push, never deploy.
- Never read or print secrets: `.env*`, `config/master.key`, `config/credentials*`.
- Development uses fake data and no live API keys. Never add a real key.

## Commands
- Understand a part of the app before changing it: `/explain <feature>`
- Start the app: `bin/dev`, then open http://localhost:3000
- Reset the fake data: `bin/rails db:seed`
- Run the checks: `bundle exec rspec`
