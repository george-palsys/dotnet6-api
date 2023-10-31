# 以 dotnet6-api 為例子，且以存放在dockerhub
1. 查看image
```
docker images |  grep docker.io/georgechiu/api
```
![image](https://github.com/george-palsys/dotnet6-api/blob/main/img/1.png)
 
2. 使用 docker 指令建立 api 容器
```
docker run -dit -p 8080:8080 docker.io/georgechiu/api:latest
```
![image](https://github.com/george-palsys/dotnet6-api/blob/main/img/2.png)
 
3. 利用curl 指令確認容器是否有提供服務
```
curl http://localhost:8080
```
![image](https://github.com/george-palsys/dotnet6-api/blob/main/img/3.png)

