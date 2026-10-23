TIMEOUT ?= 600
SUITE ?= all
QUICK ?= 0
EXPR ?= IO.inspect(ArinsalDemo.Pure.module_info(:exports) |> length)

.PHONY: deps test compile run iex compare clean

deps:
	mix deps.get

test: deps
	timeout $(TIMEOUT) mix test

compile: deps
	timeout $(TIMEOUT) mix compile --force

run: deps
	timeout $(TIMEOUT) mix run -e '$(EXPR)'

iex: deps
	iex -S mix

compare: deps
	BENCH_QUICK=$(QUICK) bench/compare.sh --suite $(SUITE) --runtime "$${RUNTIME:-arinsal}"

clean:
	rm -rf _build deps
