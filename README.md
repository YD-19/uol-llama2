# uol-llama2
## This repository is a simple way to deply llama-2 models with Docker:

### First, make sure you got the docker installed successfully, you can check it by running:
<center><code>docker run hello-world</code></center>

If error, please refer to [Docker Installation Tutorial Official Website](https://docs.docker.com/engine/install/debian/)

### simply run the following two lines in your command:

<center><code>make build</code></center>

<center><code>make start</code></center>


Then, start chatting.

## Hints:

1. you must have at least 1 GPU on your machine for 7b models. 2 GPUs for 13b models, and 8 GPU for 30b models.
2. If it is your first time to run the model, you should download the model and checklist from meta by the following command:

<center><code>make build Download=true</code></center>

3. If you want to change model, simply rebuild with the following command, for example if you want to use `13b` model:

<center><code>make build model=13b-chat</code></center>