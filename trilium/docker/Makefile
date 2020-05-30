.PHONY: build
build:
	docker build -t postables/trilium:latest -f Dockerfile .

.PHONY: build-arm32v7
build-arm32v7:
	#docker buildx create --platform=linux/arm/v7 --name trilium
	docker buildx use trilium
	docker buildx inspect --bootstrap
	env DOCKER_CLI_EXPERIMENTAL=enabled docker buildx build --platform=linux/arm/v7 -t postables/trilium-arm32v7:latest -f arm32v7.Dockerfile .
	docker buildx rm trilium
# you'll want to change the data directory to whatever is suitable
.PHONY: run-compose
run-compose:
	env DATADIR=./tpm docker-compose up
 