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

ARG model=7b-chat
ARG len=512
ARG batch=4

RUN echo "model is" ${model}
ENV MODEL=${model}
ENV LEN=${len}
ENV BAT=${batch}

ENTRYPOINT ["bash","./start-chat.sh"]

RUN echo "ALL Done"




