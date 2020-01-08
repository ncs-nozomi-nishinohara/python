tag=""

run:
	docker build -t ncsnozominishinohara/python:${tag} -f ${tag}/Dockerfile .
	docker push ncsnozominishinohara/python:${tag}