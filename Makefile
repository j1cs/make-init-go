GO := go
OUTDIR := bin
SRC := $(shell go list ./ | grep -v "\./vendor")
QUIET := @

GOBIN := $(shell go env GOPATH)/bin

.PHONY: build
build:
	$(QUIET) $(GO) build -o $(OUTDIR)/starter-app $(SRC)

.PHONY: run
run: build
	$(QUIET) ./$(OUTDIR)/starter-app

.PHONY: debug
debug:
	$(GO) build -o $(OUTDIR)/starter-app $(SRC) && $(GO) run github.com/go-delve/delve/cmd/dlv --listen=:2345 --headless=true --api-version=2 exec ./$(OUTDIR)/starter-app

.PHONY: watch
watch:
	$(QUIET) $(GO) run github.com/cespare/reflex -r '\.go$$' -s -- sh -c "make debug"

.PHONY: clean
clean:
	$(QUIET) rm -rf $(OUTDIR)

.PHONY: format
format:
	@./scripts/format.sh

.PHONY: lint
lint:
	@./scripts/lint.sh

.DEFAULT_GOAL := run
help:
	@echo "Available targets:"
	@echo "  build  - Build the application"
	@echo "  run    - Run the application"
	@echo "  debug  - Debug the application with Delve"
	@echo "  watch  - Watch for changes and rebuild the application"
	@echo "  clean  - Clean up build artifacts"
	@echo "  format - Format code"
	@echo "  lint   - Lint the code"
	@echo "  help   - Show this help message"
