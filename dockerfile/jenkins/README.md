#### ```一、构建命令```

```docker build -t xiangys0134/jenkins:v1.0.1 .```

```docker run -itd -p 8080:8080 --name jenkins  xiangys0134/jenkins:v1.0.1```

#### ```二、推送到仓库```

```shell
Username: xiangys0134
Password: 
WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded

```

```cmd
[root@docker-swarm1 nginx]# docker push xiangys0134/jenkins:v1.0.1
The push refers to repository [docker.io/xiangys0134/jenkins]
bf9326dac1d2: Pushed 
261b2f7e7511: Pushed 
d69483a6face: Mounted from library/centos 
v1.0.1: digest: sha256:f8ed3700d8ed87647481927ce624ee463a90080d4e7e1bd06ddb8e335472bd9f size: 952
```

#### ```三、启动容器```

```cmd
docker run -itd -p 8080:8080 --name jenkins  xiangys0134/jenkins:v1.0.1
```

#### ```四、问题```

```目前第一次登录时需要配置/data/jenkins/jenkins-data/secrets/initialAdminPassword，目前只能进入容器查看```

