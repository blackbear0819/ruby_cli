# ShiftCare CLI Challenge

A Ruby command-line application that searches client data and finds duplicate emails from a JSON dataset.

## Features

- Search by any field (e.g. `full_name`, `email`)
- Find duplicate emails

## Setup

```bash
git clone https://www.github.com/blackbear0819/ruby_cli.git
cd shiftcare_cli
bundle install
```

# Usage
## Search clients:

```bash
ruby client_searcher.rb -s full_name,Jane
```

## Find duplicate emails:
```bash
ruby client_searcher.rb -d
```

## Run Tests
```bash
rspec
```
