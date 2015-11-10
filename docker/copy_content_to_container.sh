
docker exec -i $CONTAINER_NAME  /bin/bash -c 'cat > file' < file

tar -c aa.sh | docker exec -i $CONTAINER_NAME tar -x -C /root/
