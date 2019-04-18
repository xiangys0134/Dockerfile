#### ```一、构建命令```

```docker build -t xiangys0134/php:v1.0.2 .```

#### ```二、启动容器```

```docker run -v /data/php/logs:/var/log/php-fpm -itd -p 9001:9000 --network lnmp --name my_php03  xiangys0134/php:v1.0.2```

#### 三、推送到仓库

```shell
[root@docker-swarm1 html]# docker login 
Authenticating with existing credentials...
WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```



```shell
[root@docker-swarm1 html]# docker push xiangys0134/php:v1.0.2
The push refers to repository [docker.io/xiangys0134/php]
a5bc16f4bce3: Pushed 
8cb16c3695c2: Pushed 
d69483a6face: Mounted from xiangys0134/nginx 
v1.0.2: digest: sha256:c93537aae554025bc2b26b2aaa047c878f02b6bd2ba6c8f4cbe423b11253a8b7 size: 950
```

