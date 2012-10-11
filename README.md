# Viral Dispatch
Stay up to date with the latest and greatest :star:Viral News:star:

This is really just a practice app. Don't take it to :heart:.

## Setup

Locally, just register a facebook/twitter/github app and set those variables
in your `.env`. The `.env.example` file has some setup examples.

Afterwards, just run `foreman start`

#### Heroku

When deploy this to heroku, be sure to set your heroku configs correctly
for these vars:

    heroku config:add GITHUB_CLIENT_ID=xxxxxxxxxxxxxxxxxxxxx
    heroku config:add GITHUB_CLIENT_SECRET=1111111111111111xxxxxxxxxxxxxxxxxxxxx

## Features
* Starting a post
* Removing your own post
* User sign in (most likely through facebook/twitter/github)
* ??? MORE TO COME I'M SURE

## License
See [LICENSE](https://github.com/brntbeer/viral_dispatch/blob/master/LICENSE)
