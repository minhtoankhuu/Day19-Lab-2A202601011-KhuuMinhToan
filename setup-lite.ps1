python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
Get-ChildItem notebooks\*.py | ForEach-Object { jupytext --to notebook --update $_.FullName }
if (-Not (Test-Path .env)) { Copy-Item .env.example .env }
python scripts/seed_corpus.py
python scripts/verify_lite.py
