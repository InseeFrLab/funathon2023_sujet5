#!/bin/bash

# Clone course repository
REPO_URL="https://github.com/InseeFrLab/funathon2023_sujet5.git"
CLONE_DIR="/home/onyxia/work/funathon-sujet5"
git clone --depth 1 $REPO_URL $CLONE_DIR
cd $CLONE_DIR

# Install required packages
pip install -r requirements.txt
python -m spacy download fr_core_news_md

# Copy intermediary data
mkdir data
mc cp s3/projet-funathon/2023/sujet5/diffusion/reviews_takeaway.parquet data/reviews_takeaway.parquet

# Open the relevant notebook when starting Jupyter Lab
jupyter server --generate-config
echo "c.LabApp.default_url = '/lab/tree/funathon-sujet5/tutoriel.ipynb'" >> /home/onyxia/.jupyter/jupyter_server_config.py
