REPO = UoL_LLAMA
Download = false
model = 7b-chat
seq_len = 2048
batch_size = 4

build:
ifeq (${Download}, true)
	bash llama/download.sh
endif
	docker build -t my/llama ./DockerEnvs --build-arg model=${model} --build-arg len=${seq_len} --build-arg batch=${batch_size}

start:
	bash DockerEnvs/run_docker_chat7b.bash
