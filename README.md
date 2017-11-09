# base-gradle
A docker images which is used by a Jenkins Pipeline to build gradle projects

Build a docker image

    docker build -t base-gradle:v1 .

Tag and push image to docker hub

    # login to docker
    
    docker tag base-gradle:v1 bitstack701/base-gradle:v1
    
    docker push bitstack701/base-gradle:v1 