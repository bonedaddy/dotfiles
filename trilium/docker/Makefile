.PHONY: build
build:
	docker build -t postables/trilium:latest .

# you'll want to change the data directory to whatever is suitable
.PHONY: run-compose
run-compose:
	env DATADIR=./tpm docker-compose up