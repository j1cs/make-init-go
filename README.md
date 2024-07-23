# Golang Make Init

## Porpuse

This is a simple project to help you get started with Golang and Make.

## Getting Started

To get started, you need to have the following installed:

- Go 1.22.0
- GNU Make latest

### Watch
To run the debugger and the watcher, you can run the following command:

```bash
make watch
```

## Other options

### Run
```bash
make run
```

This will create a new directory called `bin` to run the project.

### Debug
If you want to debug the project, you can run the following command:

```bash
make debug
```

Remeber to configure your IDE to use the `dlv` debugger.


## Extras
We reload the project on every change (only go files), so you can just run `make debug` or `make watch` and start coding.

You can also run `make format` to format the code and `make lint` to lint the code.

## Help
If you need help, you can run `make help` to see the available targets.

## License
MIT