all: build

include .env
$(eval export $(shell sed -ne 's/ *#.*$//; /./ s/=.*$$// p' .env))

.PHONY: build
build:
	@echo "📦 Building app"
	@docker-compose build --no-cache

serve:
	@echo "🚀 Serving app"
	docker-compose up -d

down:
	@echo "🔌 Disconnecting"
	@docker-compose down

restart:
	@echo "↩️ Restarting"
	@docker-compose restart

connect:
	@echo "🔞 Connecting to container"
	@docker-compose run --rm --entrypoint bash

log:
	@echo "📋 Showing logs"
	@docker-compose logs -f --tail 100 ${T}

lint:
	@echo "🔦 Linting code"

test:
	@echo "🏃‍ Running tests"

deploy: lint test
	@echo "🛫 Let's deploy!!!"
	@docker-compose run --rm --entrypoint /bin/sh serverless -c "cd /code/ && serverless deploy"