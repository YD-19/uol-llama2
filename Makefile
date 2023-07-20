REPO = UoL_LLAMA

build:
	bash llama/download.sh
	docker build -t my/llama ./DockerEnvs

start:
	bash DockerEnvs/run_docker_chat7b.bash
