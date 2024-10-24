#!/bin/bash

# Run preprocessing
python preprocessing/preprocessing.py

# Run processing
python processing/processing.py

# Run postprocessing
python postprocessing/postprocessing.py