# If not working, first do: sudo rm -rf /tmp/.docker.xauth
# It still not working, try running the script as root.
## Build the image first
### docker build -t r2_path_planning .
## then run this script
xhost local:root


XAUTH=/tmp/.docker.xauth

docker run -it --rm \
    --name=gpu_container \
    -e DISPLAY=:0 \
    --volume="${HOME}/.Xauthority:/root/.Xauthority:rw" \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --net=host \
    --privileged \
    --runtime=nvidia \
    -e NVIDIA_VISIBLE_DEVICES=all \
    --mount type=bind,source=${PWD}/llama,target=/home/llama \
    my/llama \
    bash \
    

echo "Done."