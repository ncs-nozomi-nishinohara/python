tag=""

run:
	$(eval base := $(shell tr '/' '-'<<<${tag}))
	docker build -t ncsnozominishinohara/python:${base} -f ${tag}/Dockerfile .
	docker push ncsnozominishinohara/python:${base}

ppc64le:
	$(eval base := $(shell tr '/' '-'<<<${tag}))
	docker build -t ncsnozominishinohara/python:${base}-ppc64le -f ${tag}/Dockerfile .
	docker push ncsnozominishinohara/python:${base}-ppc64le