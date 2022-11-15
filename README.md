# MsServer

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Install Node.js dependencies with `npm install` inside the `assets` directory
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Production Build

- ./build.sh
- \_build/prod/rel/ms_server/bin/ms_server start to run in background
- \_build/prod/rel/ms_server/bin/ms_server stop

## Api

- Recipes List
  - Method: GET
  - URL: http://localhost:4000/api/v1/recipes
- Recipe Detail
  - Method: GET
  - URL: http://localhost:4000/api/v1/recipes/{id}
