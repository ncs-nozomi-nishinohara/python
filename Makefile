tag=""

run:
	docker build -t ncsnozominishinohara/python:${tag} -f ${tag}/Dockerfile ${tag}
	docker push ncsnozominishinohara/python:${tag}