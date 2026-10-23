# Arinsal Demo

This small Elixir OTP application demonstrates workloads supported by Arinsal: arithmetic and list processing, maps and structs, binaries and JSON, ETS, processes, messages, and GenServer calls. The `test/` suite checks those results, while `bench/` contains Benchee scenarios for comparing the workloads.

## Install

Install [asdf](https://asdf-vm.com/) and use the versions pinned in `.tool-versions`. The Arinsal runtime comes from the [`arinsal-io/asdf-arinsal`](https://github.com/arinsal-io/asdf-arinsal) plugin:

```sh
asdf plugin add arinsal https://github.com/arinsal-io/asdf-arinsal.git
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install
```

The asdf plugin and Arinsal releases are private while the project is private, so GitHub Actions needs an `ARINSAL_TOKEN` secret with read access to both repositories. The `.tool-versions` file pins Arinsal `0.0.1` and Elixir `1.20.4-otp-29`.

## Run and test

Fetch dependencies, run the tests, or start an expression with Mix:

```sh
mix deps.get
mix test
mix run -e 'IO.inspect(ArinsalDemo.Pure.module_info(:exports))'
```

Mix starts the Erlang runtime selected on `PATH`. With the asdf Arinsal version selected, `mix test` exercises Arinsal. To compare against reference ERTS, install Erlang/OTP 29.1.1 and Elixir 1.20.4, select that runtime on `PATH`, and run the same command. GitHub Actions runs both runtimes on macOS 14 and Ubuntu 24.04 ARM.

Run a benchmark suite with `make compare SUITE=maps`; use `QUICK=1` for a shorter run. The default suite set is `all`, and output is written under the ignored `bench/out/` directory.
