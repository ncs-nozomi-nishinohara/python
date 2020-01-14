tag=""

run:
	docker build -t ncsnozominishinohara/python:${tag}-ppc64le -f ${tag}/Dockerfile .
	docker push ncsnozominishinohara/python:${tag}-ppc64le