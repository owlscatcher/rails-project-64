### Hexlet tests and linter status:

[![CI Status](https://github.com/owlscatcher/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/owlscatcher/rails-project-63/actions)
[![Actions Status](https://github.com/owlscatcher/rails-project-64/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/owlscatcher/rails-project-64/actions)

# Collective Blog

This project is a small blog like habr in which users can read other users' posts, comment and like them, and publish their own posts.

Project published on render: https://cb.owlpaw.com

## Local installation

```bash
git clone git@github.com:owlscatcher/rails-project-64.git && \
  cd ./rails-project-64 && \
  make setup
```

## Starting project

```bash
make start
```

## Refreshing database

```bash
make cleanup
```

## Starting tests and linting code

```bash
make check
```

Or start them separately:

```bash
make lint
```

```bash
make test
```
