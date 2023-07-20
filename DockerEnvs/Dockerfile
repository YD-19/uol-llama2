# This is an example Docker File
#  Command to build it
# docker built -t <image name > .
FROM python:3

WORKDIR /home

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN apt-get update
RUN apt-get install -y git && apt-get install -y python3-pip

COPY start-chat.sh ./
COPY chat_test.py ./

ARG model

RUN echo "model is" ${model}
ENV MODEL=${model}

ENTRYPOINT ["bash","./start-chat.sh", "model=${model}"]

RUN echo "ALL Done"




