IMAGE=$1
COMMAND=${@:2}

if [ -z "$(docker images -q $IMAGE:latest)" ];
then
    docker build $IMAGE -t $IMAGE
fi

docker run --rm -it \
    -u $UID:$GID \
    -w $PWD \
    -v /etc/group:/etc/group:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/shadow:/etc/shadow:ro \
    -v $HOME:$HOME \
    -v /mnt:/mnt  \
    $IMAGE $COMMAND
