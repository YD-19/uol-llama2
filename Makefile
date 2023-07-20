REPO = UoL_LLAMA
Download = false
model = 7b-chat
build:
ifeq (${Download}, true)
	bash llama/download.sh
endif
	docker build -t my/llama ./DockerEnvs --build-arg model=${model}

start:
	bash DockerEnvs/run_docker_chat7b.bash
