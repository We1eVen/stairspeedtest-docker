原作者: https://github.com/tindy2013/stairspeedtest-reborn

---

# stairspeedtest-reborn
<img src="https://img.shields.io/github/license/We1eVen/stairspeedtest-docker.svg"/>  <img src="https://img.shields.io/github/last-commit/We1eVen/stairspeedtest-docker.svg"/>  <img src="https://img.shields.io/docker/image-size/weleven11/stairspeedtest-reborn/latest"/>  

#### dockerhub：https://hub.docker.com/r/weleven11/stairspeedtest-reborn

## 使用方法

```
docker run -d \
-p 65430:65430 \
weleven11/stairspeedtest-reborn
```
访问 http://ip:65430

## 可选环境变量

* __`PORT`__:监听端口。可选，默认65430
* __`MAXFORKS`__:最大同时测试数。可选，默认1
* __`THREAD`__:使用线程数。可选，默认4

***示例***

>监听8080端口，最大同时2测试，单线程
```
docker run -d \
--net=host \
-e PORT=8080 \
-e MAXFORKS=2 \
-e THREAD=1 \
weleven11/stairspeedtest-reborn
```

## 映射结果目录

```
docker run -d \
-p 65430:65430 \
-v /path/to/results:/speedtest/results \
weleven11/stairspeedtest-reborn
```
其中，`/path/to/results`替换为你自己的目录

## 自定义配置文件

```
docker run -d \
-p 65430:65430 \
-v /path/to/pref.ini:/speedtest/pref.ini \
weleven11/stairspeedtest-reborn
```
其中，`/path/to/pref.ini`替换为你自己的配置文件路径

*注意：若同时修改环境变量与配置文件中的线程数，则使用配置文件中指定的线程数。若修改二者其中之一，则使用修改值。*

## 使用docker-compose

```
git clone https://github.com/We1eVen/stairspeedtest-docker
cd stairspeedtest-docker
docker compose up -d
```

---

# 构建

```
git clone https://github.com/We1eVen/stairspeedtest-docker
cd stairspeedtest-docker
docker buildx build --platform linux/amd64,linux/arm64 .
```