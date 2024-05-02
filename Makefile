start:
	rm -rf tmp/pids/server.pid
	bin/rails s -b 0.0.0.0

setup:
	bundle install

check: test lint

lint:
	bundle exec rubocop -a
	bundle exec slim-lint app/views/

test:
	bin/rails test

.PHONY: test
