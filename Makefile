# Makefile

.PHONY: prereqs build test docker

# Define directories
PREPROCESS_DIR=preprocessing
PROCESS_DIR=processing
POSTPROCESS_DIR=postprocessing

# Install Python dependencies
prereqs:
	@echo "Installing dependencies..."
	pip install -r requirements.txt

# Build executables
build:
	@echo "Building preprocessing executable..."
	python $(PREPROCESS_DIR)/preprocessing.py
	@echo "Building processing executable..."
	python $(PROCESS_DIR)/processing.py
	@echo "Building postprocessing executable..."
	python $(POSTPROCESS_DIR)/postprocessing.py

# Run tests
test:
	@echo "Running preprocessing tests..."
	python -m unittest $(PREPROCESS_DIR)/tests/test_preprocessing.py
	@echo "Running processing tests..."
	python -m unittest $(PROCESS_DIR)/tests/test_processing.py
	@echo "Running postprocessing tests..."
	python -m unittest $(POSTPROCESS_DIR)/tests/test_postprocessing.py

# Build Docker image
docker:
	docker build -t sentimentclassifier:latest .

run_all:
	@echo "Running preprocessing..."
	python preprocessing/preprocessing.py
	@echo "Running processing..."
	python processing/processing.py
	@echo "Running postprocessing..."
	python postprocessing/postprocessing.py
	@echo "All steps completed."
