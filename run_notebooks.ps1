mkdir -Force submission/screenshots
$env:PYTHONIOENCODING="utf-8"
.\.venv\Scripts\Activate.ps1
echo "Running 01..."
python notebooks/01_embeddings_index.py > submission/screenshots/01_output.txt 2>&1
echo "Running 02..."
python notebooks/02_hybrid_search_rrf.py > submission/screenshots/02_output.txt 2>&1
echo "Running 03..."
python notebooks/03_search_api_benchmark.py > submission/screenshots/03_output.txt 2>&1
echo "Running 04..."
python notebooks/04_feast_feature_store.py > submission/screenshots/04_output.txt 2>&1
echo "All notebooks executed."
