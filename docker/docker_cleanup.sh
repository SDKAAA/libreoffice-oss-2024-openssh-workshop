#!/bin/bash

sudo docker kill $(sudo docker ps --all | awk '!/CONTAINER/ {print $1}' | xargs)
sudo docker rm $(sudo docker ps --all | awk '!/CONTAINER/ {print $1}' | xargs)  
# uncomment the below line if you need to also clear the images. it was commented in order to avoid needing to re-download the images from the internet after each cleanup; good idea if you break things frequently and/or working on a less reliable internet connection.
# sudo docker rmi $(sudo docker images --all | awk '!/REPOSITORY/ {print $3}' | xargs)
sudo docker network prune -f
sudo docker system prune -f
