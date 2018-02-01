NOTEBOOKS=$1

function print_usage {
    echo "Usage: $0 [path]"
    echo "[path] = path to directory of notebooks you want to use"
    echo ""
    exit 1
}

if [ -z $NOTEBOOKS ]; then
    print_usage
fi

CONTAINER_NAME=anaconda
docker build -t ${CONTAINER_NAME} .
docker run -p 8888:8888 -v $NOTEBOOKS:/opt/workingdir/$(basename $NOTEBOOKS) ${CONTAINER_NAME}
