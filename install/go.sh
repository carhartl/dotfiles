#!/bin/sh

go install github.com/rakyll/gotest@latest
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/vuln/cmd/govulncheck@latest
go install mvdan.cc/sh/v3/cmd/shfmt@latest
