defmodule MsServer.ReleaseTasks do
  @start_apps []

  @repos []

  # Run all the migrations of the Applications
  def run_migrations do
    IO.puts("Loading...")
    # Load the code for myapp, but don't start it
    :ok = Application.load(:ms_server)

    IO.puts("Starting dependencies..")
    # Start apps necessary for executing migrations
    Enum.each(@start_apps, &Application.ensure_all_started/1)

    # Signal shutdown
    IO.puts("Success!")
    :init.stop()
  end

  def run_migrations_with_seed do
    IO.puts("Loading ...")
    # Load the code for myapp, but don't start it
    :ok = Application.load(:ms_server)

    IO.puts("Starting dependencies..")
    # Start apps necessary for executing migrations
    Enum.each(@start_apps, &Application.ensure_all_started/1)

    # Signal shutdown
    IO.puts("Success!")
    :init.stop()
  end

  def update_asset_table do
    IO.puts("Loading ...")
    # Load the code for myapp, but don't start it
    :ok = Application.load(:ms_server)

    IO.puts("Starting dependencies..")
    # Start apps necessary for executing migrations
    Enum.each(@start_apps, &Application.ensure_all_started/1)

    # Start the Repo(s) for myapp
    IO.puts("Starting repos..")
    Enum.each(@repos, & &1.start_link(pool_size: 2))

    # Run the seed script if it exists
    seed_script = Path.join([priv_dir(:ms_server), "repo"])

    if File.exists?(seed_script) do
      IO.puts("Running seed script..")
      Code.eval_file("update_asset_table.exs", seed_script)
    end

    # Signal shutdown
    IO.puts("Success!")
    :init.stop()
  end

  def priv_dir(app), do: "#{:code.priv_dir(app)}"
end
