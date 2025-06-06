Docker registry: it is platform where all the images can be pushed and can be download the image

docker image: copy of the package 

docker container : it is replica of the image to run the package

docker deamon : it is engine which helps us to communicate to docker registry using api

how to pull image : 
   
 docker pull <image_name>

ex: docker pull ubuntu

how to create container or how to run image:

docker run -it <image_name>
ex:  docker run -it ubuntu

# instruction :
# FROM baseImage :  Set the base image to use for any subsequent instructions that follow 
#                   and also give this build stage a name.
# # Install dependencies

FROM ubuntu
# WORKDIR /the/workdir/path :Set the working directory for any 
#         ADD, COPY, CMD, ENTRYPOINT, or RUN instructions that follow.

WORKDIR /app1

# COPY source dest :Copy files or folders from source 
#                  to the dest path in the image's filesystem.

COPY . /app1/

# ADD source dest : Copy new files, directories or remote URLs to the image's filesystem
#                  and also extract compressed files.
# ADD https://github.com/shwetakanaki/10batch.git  /app1/text.txt 
ADD  . /app1

# RUN command : Execute any commands in a new layer on top of the current image and
#               commit the results. The result of this command will be used in the next step.
RUN apt-get update && apt-get install -y python3 python3-pip

# CMD [ "executable" ] : Execute any commands in a new layer on top of the while creating the conatiner.


CMD ["python3", "app.py"]
CMD ["python3", "app1.py"]
#it will be overridden by the ENTRYPOINT instruction or cmd instructions.
# ENTRYPOINT [ "executable" ] : Set the command and parameters that will always be executed when the container starts.
# it will not be overridden by the CMD instruction.
ENTRYPOINT ["python3", "app.py"]
ENTRYPOINT ["python3", "app1.py"]
PORT 5000 : Expose a port to the outside world.
EXPOSE  5000
# ENV key=value : Set an environment variable in the container.
ENV NAME World




to build the image:

docker build -t <image_name>:<tag_name> .
ex: docker build -t java12:t1 .

to run the image:
docker run -it <image_name>:<tag_name>
ex: docker run -it java12:t1

to create rep:
docker tag <image_name>:<tag_name> <user_name>/<image_name>:<tag_name>
ex: docker tag java:t2 shweta1978/java12:t1

to push image :
docker push <image_name>

ex: docker push shweta1978/java12:t1 

to remove the image :
docker rmi <image_name>

to remove conatiner 
docker rm <containerid>

to remove all images AND conatiner 
docker syatem prune -a 

to see the running conatiners 
docker ps 

to see the all the conatiner (running and stoped )
docker ps -a

to create the volume 
docker  volume create  docker5-6

to attach volume 
docker run --name database  --mount source=docker5-6,target=/app1 java:t1

to create the network:
docker  network  create <network_name >

to attach the network to container 
docker run --name <conatiner_name> --network=network_name  <image_name>

to update the ubuntu :
apt-get update 

to install the ping package :
apt-get install iputils-ping -y 

to call the ip : 
ping ipaddress 