.PHONY: help install install-dev install-tune test lint format clean \
        train evaluate tune run-api dashboard

help:
	@echo "Targets:"
	@echo "  install       Install core deps + project (editable)"
	@echo "  install-dev   Install core + dev deps"
	@echo "  install-tune  Install core + tuning extras (optuna, ray)"
	@echo "  test          Run pytest with coverage"
	@echo "  lint          Check lint + format (no changes)"
	@echo "  format        Auto-fix lint + format"
	@echo "  clean         Remove caches and build artifacts"
	@echo "  train         Run training pipeline"
	@echo "  evaluate      Run evaluation pipeline"
	@echo "  tune          Run hyperparameter tuning"
	@echo "  run-api       Start FastAPI inference server"
	@echo "  dashboard     Start visualization dashboard"

install:
	python -m pip install --upgrade pip
	pip install -e .

install-dev:
	python -m pip install --upgrade pip
	pip install -e ".[dev]"

install-tune:
	python -m pip install --upgrade pip
	pip install -e ".[dev,tune]"

test:
	pytest -q

lint:
	ruff check src tests scripts
	ruff format --check src tests scripts

format:
	ruff check --fix src tests scripts
	ruff format src tests scripts

clean:
	rm -rf .pytest_cache .ruff_cache .coverage htmlcov build dist *.egg-info
	rm -rf mlruns mlartifacts
	rm -rf outputs/checkpoints/* outputs/metrics/* outputs/logs/*
	find . -type d -name "__pycache__" -exec rm -rf {} +

train:
	python scripts/train.py

evaluate:
	python scripts/evaluate.py

tune:
	python scripts/tune.py

run-api:
	uvicorn api.main:app --reload --host 0.0.0.0 --port 8000

dashboard:
	streamlit run src/visualization/dashboards.py