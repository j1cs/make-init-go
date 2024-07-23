#!/usr/bin/env bash

go run github.com/golangci/golangci-lint/cmd/golangci-lint run internal/... | tee /dev/stderr
