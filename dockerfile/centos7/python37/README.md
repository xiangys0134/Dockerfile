# What is this?
Python3.7 in a docker container. Quickly create local Python3.7 in 5 secs.

# How to use?
Simply run(replace related args with your custom value)
```bash
sudo docker run -d --restart=yes centos:python37-1.0.1
```
OR

Clone this repo and go into it
```bash
 git@github.com:xiangys0134/Dockerfile.git
```
Setting connection info in *docker-compose.yml*, then run
```bash
sudo docker-compose up -d
```

# Build your own image
If you would like to build your own docker image, simply clone this repo and run:
```bash
 sudo docker build -t <your-image-name> .
```
