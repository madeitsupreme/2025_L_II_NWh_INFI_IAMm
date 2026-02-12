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

