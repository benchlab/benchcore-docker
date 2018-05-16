# Makefile For The Official BenchCore Docker Image

all:
	docker build --tag benchlab/benchcore benchcore

.PHONY: all
