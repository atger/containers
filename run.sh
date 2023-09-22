IMAGE=$1
ARG=$2
docker run --rm -it \
    -u $UID:$GID \
    -w $PWD \
    -v /etc/group:/etc/group:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/shadow:/etc/shadow:ro \
    -v $HOME:$HOME \
    -v /mnt:/mnt  \
    $IMAGE $ARG
