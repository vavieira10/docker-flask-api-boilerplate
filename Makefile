version ?= latest
IMAGE = your-path:$(version)
dockerrun = docker run --rm $(IMAGE)

release:
	git tag -a $(version) -m "Generated release "$(version)
	git push origin $(version)

image:
	docker build -t $(IMAGE) .

shell: image
	docker run -ti --rm $(IMAGE) bash

unit-tests:
	./scripts/unit.sh $(parameters)

lint: image
	$(dockerrun) ./scripts/lint.sh $(parameters)

integration-tests: image
	docker-compose run --rm project ./scripts/integration.sh $(parameters)

cleanup: 
	docker-compose down

coverage: image
	docker run --rm $(IMAGE) ./scripts/check.sh --coverage 

coverage-show: coverage
	xdg-open ./tests/coverage/index.html
