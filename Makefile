.PHONY: deps lint test run
deps:
	@echo "Installing dependencies..."
	pip install -r requirements.txt
	pip install -r test_requirements.txt

lint:
	@echo "Running linter..."
	flake8 hello_world test

test: lint
	@echo "Running tests..."
	PYTHONPATH=. python3 -m pytest -v

run:
	@echo "Running application..."
	python main.py

docker_build:
	docker build -t hello-world-printer .

docker_run: docker_build
	docker run \
		--name hello-world-printer-dev \
		-p 5000:5000 \
		-d hello-world-printer

TAG=$(USERNAME)/hello-world-printer

docker_push: docker_build
	@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
	docker tag hello-world-printer $(TAG); \
	docker push $(TAG); \
	docker logout;
