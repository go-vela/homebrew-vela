# homebrew-vela

Vela is a Pipeline Automation (CI/CD) framework built on [Linux container](https://linuxcontainers.org/) technology written in [Golang](https://golang.org/).

Vela uses a syntax similar to [Docker Compose](https://docs.docker.com/compose/) to define its configuration. This structure for repeated use, within the application, is called a pipeline and a single execution of a pipeline is referenced as a build.

## Installation

This repository is the Tap for Vela [Homebrew](https://brew.sh/) formulas.

This assumes that Homebrew is already installed and configured.

```sh
# add Vela tap to your brew configuration
brew tap go-vela/vela

# install Vela CLI
brew install vela
```

## Documentation

For usage, please [visit our docs](https://go-vela.github.io/docs).

## Contributing

We are always welcome to new pull requests!

Please see our [contributing](CONTRIBUTING.md) documentation for further instructions.

## Support

We are always here to help!

Please see our [support](SUPPORT.md) documentation for further instructions.

## Copyright and License

```
Copyright (c) 2021 Target Brands, Inc.
```

[![license](https://img.shields.io/crates/l/gl.svg)](LICENSE)
