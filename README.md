## Development with Docker

### Dependencies

1. Install [Docker](https://www.docker.com/products/docker-desktop)
2. Install Make: `sudo apt install make` or `brew install make`

### First run

1. Clone the project repository: `git clone git@github.com:Plus17/phoenix-boilerplate.git`
2. Go to project dir: `cd phoenix-boilerplate`
3. Execute: `make setup` to install dependencies, setup the database, execute migrations, etc.
4. Get a `.env` file executing `cp env.template .env` and set the `SECRET_KEY_BASE` value. Get a new value executing `make gen.secret`
5. Execute: `make run` to run the server at http://localhost:4000
### New environment variables

If you want to add new environment variables you need to put the new env var in some places:

1. In the `.env.dist` template file to include in new installations
2. In your `.env` file

NOTE: When you add a new env var you must restart the container, so the container can read the new variable.
### Makefile

For convenience, you can use the commands included in the Makefile:

| Command                                                           | Description                                           |
| ----------------------------------------------------------------- | ----------------------------------------------------- |
| `make bootstrap`                                                  | Bootstrap the phoenix project (dependencies & databse)|
| `make deps.get`                                                   | Gets & compile dependencies                           |
| `make deps.clean`                                                 | Clean unused dependencies & remove from mix.lock      |
| `make seeds`                                                      | Run seeds                                             |
| `make reset`                                                      | Resets the project removing deps & builds             |
| `make ecto.setup`                                                 | Setup the database for dev                            |
| `make ecto.reset`                                                 | Resets the database for dev                           |
| `make ecto.reset.test`                                            | Resets the database for test                          |
| `make test`                                                       | Runs tests                                            |
| `make check.all`                                                  | Run all CI verifications (formatter, credo, coverage) |
| `make run`                                                        | Start **Phoenix** server                              |
| `make gettext`                                                    | Search & merge new translations                       |
| `make format`                                                     | Format all phoenix files                              |

## Development without Docker

### Dependencies

1. Install [asdf](https://asdf-vm.com/guide/getting-started.html#_1-install-dependencies)
2. Add the [asdf erlang plugin](https://github.com/asdf-vm/asdf-erlang) `asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git`
3. Add the [asdf elixir plugin](https://github.com/asdf-vm/asdf-elixir) `asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git`
4. Install [fnm](https://github.com/Schniz/fnm) `curl -fsSL https://fnm.vercel.app/install | bash`
### First run

1. Clone the project repository: `git clone git@github.com:Plus17/phoenix-boilerplate.git my_app`
2. Go to project dir: `cd my_app`
3. Install Erlang, Elixir & NodeJS using the `.tools-versions` file with: `asdf install`
4. Install NodeJs usign the `.node-version` file with `fnm install`
5. Copy the `env.dist` file to `.env` and set the `SECRET_KEY_BASE` value. Get a new value executing `mix phx.gen.secret`.
6. Run `export $(cat .env | xargs)` on project root folder
7. Run `mix local.hex && mix local.rebar`
8. Run `mix setup` to download dependencies & setup database
9. Run `mix phx.server`

### New environment variables

If you want to add new environment variables you need to put the new env var in some places:

1. In the `.env.dist` template file to include in new installations
2. In your `.env` file.
