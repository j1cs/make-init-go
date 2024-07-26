//go:build tools
// +build tools

package tools

import (
	_ "github.com/cespare/reflex"
	_ "github.com/go-delve/delve/cmd/dlv"
	_ "github.com/golangci/golangci-lint/cmd/golangci-lint"
)
