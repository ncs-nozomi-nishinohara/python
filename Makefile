SHELL := /bin/bash
ARC=linux/amd64,linux/ppc64le,linux/arm64
tag=""

run:
	docker buildx build --platform ${ARC} -o type=registry -t ncsnozominishinohara/python:${tag} -f ${tag}/Dockerfile .
	# docker push ncsnozominishinohara/python:${tag}