Docker 101 (draft)
------------------

# <a name="toc"></a> สารบัญ

- [Docker คืออะไร](#what-is-docker)
- [ทำไมควรใช้ Docker](#why-docker)
- [ติดตั้ง Docker](#install-docker)
- [เริ่มต้นใช้งาน Docker](#docker-basic)
 - [คำสั่งพื้นฐาน](#docker-commands)
 - [Docker Compose](#docker-compose)
- [การใช้ Docker ขั้นสูง](#docker-advance)
 - Build image
 - Docker Registry
- [อ้างอิง](#docker-reference)

## <a name="what-is-docker"></a> Docker คืออะไร

คำว่า Docker แทน 2 อย่าง

1. คือชื่อบริษัท Docker Inc.
2. คือคำสั่ง docker

แต่ถ้าเจอว่ามีการพูดถึง `Docker Engine` อันนั้นก็หมายถึงคำสั่ง docker 
ส่วนชุดซอฟต์แวร์ของ Docker ก็มีหลายชิ้น ได้แก่

- Docker Engine เป็นตัวเอก
- Docker Machine เป็นซอฟต์แวร์สำหรับสร้าง หรือ เซ็ตอัพเครื่องให้พร้อมสำหรับ container
- Docker Swarm เป็นซอฟต์แวร์ที่เอา Engine หลาย ๆ ตัวมารวมกัน ให้เป็นตัวใหญ่ ๆ (cluster) ตัวเดียว
- Docker Compose เป็นซอฟต์แวร์ที่ใช้บอกว่า container แต่ละตัวทำงานกันยังไง เชื่อมกันยังไง

สรุปว่า container คล้าย ๆ VM แต่ เบากว่า overhead น้อยกว่า รันได้เร็วกว่าและ Docker ทำให้เราใช้ container ได้ง่ายขึ้นไปอีกจนทำให้เราหลอมทักษะการ Development กับ Operations เข้าด้วยกันเป็น DevOps ได้

![](https://mjaglan.github.io/images/docker-virtualbox/docker-vs-vm.png)

### Software Container คืออะไร

Software Container เป็น concept ของการสร้างสภาพแวดล้อมเฉพาะให้ซอฟต์แวร์ทำงานได้โดยไม่กวนกับซอฟต์แวร์ตัวอื่นบนระบบปฏิบัติการเดียวกัน เราสามารถเอา container ไปรันในคอมพิวเตอร์หรือ server เครื่องไหนก็ยังทำงานได้เหมือนเดิม โปรแกรมใน container ยังทำงานได้ปกติไม่ผิดเพี้ยนจากเดิม

จากประโยชน์ของ Software Container ที่เราเห็นจึงได้เกิด Engine ที่ชื่อว่า Docker เพื่อเป็นตัวจัดการ container ซึ่งเป็นตัวที่ใช้งานได้ง่ายกว่าตัวอื่นๆ ทำให้ได้รับความนิยมในวงกว้าง
 
Docker คือ Software Container ที่ถูกพัฒนาขึ้นมาให้สามารถจัดการ Container ได้ง่าย ทำให้เราสามารถห่อระบบของเราแล้วเอาไปรันที่ไหนก็ได้ ที่มี Docker ติดตั้งไว้ หรือก็คือ Virtual Machine แบบนึงเหมือนกับที่เราใช้ VMware, VirtualBox หรืออะไรพวกนี้ แต่ Docker ต่างจาก VM ตัวอื่น ๆ ตรงที่ VM จะจำลองมันทั้ง OS เลย แต่ Docker สร้าง Container เพื่อจำลอง Environment สำหรับ 1 Service เท่านั้น

## <a name="why-docker"></a> ทำไมควรใช้ Docker
  
### 1. เร็วกว่า VM มากๆ

ถ้าใครที่ใช้ VM มาก่อน จะพบว่ามันเป็นอะไรที่ ช้าและเสียเวลามากกว่าจะโหลดขึ้น แต่ Docker นั้นเร็วมากๆ เพราะว่า มันใช้ OS, CPU และ Memory ร่วมกันกับ Host OS ทำให้มันเบาหวิวเลย ต่างกับ VM ที่ใช้ทุกอย่างแยกกันหมด และการจำลองทั้ง OS ก็ทำให้มีบางอย่างที่เราไม่ได้ใช้ แต่ก็ต้องรัน ทำให้เราเสียทรัพยากรไปฟรีๆ
 
### 2. มีระบบ Registry

ระบบนี้จะช่วยให้เราสามารถติดตั้งโปรแกรมหรือ Environment ที่เราต้องการได้เร็วขึ้น เพราะว่ามันมีคนทำไว้ให้เราแล้ว โดยเราแค่เพียงโหลด Image ตัวนั้นมา และติดตั้ง ก็สามารถใช้ Environment นั้นได้เลย ซึ่งทาง Docker มีสิ่งที่เรียกว่า [Docker Hub](https://hub.docker.com/) อยู่ โดยเราสามารถ push ตัว image ที่เราสร้างไว้ขึ้นไป หรือเราจะไป pull image ที่คนอื่นสร้างไว้มาใช้ก็ได้ และตอนนี้ใน Docker Hub ก็มี image มากมายทั้ง official และที่ทำเองให้เราเลือกใช้
 
### 3.สะดวก

บางคนอาจจะจำเป็นต้องใช้ Environment ที่มีโปรแกรมเยอะมากๆ หรือติดตั้งโปรแกรมที่ทำยากๆ เช่น อยากได้ Elasticsearch เป็นต้น เมื่อก่อนเราก็ต้องสร้าง VM ขึ้นมาและค่อยติดตั้ง Elasticsearch ซึ่งกินเวลามาก แต่ด้วย image สำเร็จรูปทำให้เราสามารถติดตั้งโปรแกรม หรือตั้งค่า Environment ที่เราต้องการได้ภายในเวลาไม่กี่วินาทีและไม่กี่คำสั่งเท่านั้น !!!

## <a name="install-docker"></a> ติดตั้ง Docker

- [Install Docker for Windows 10](https://docs.docker.com/docker-for-windows/install)
- [Install Docker for Mac (macOS)](https://docs.docker.com/docker-for-mac/install/)

## <a name="docker-basic"></a> เริ่มต้นใช้งาน Docker

![](https://cdn-images-1.medium.com/max/1600/1*qflwrydBkx5DSFUUxRuy-w.png)

### <a name="docker-commands"></a> คำสั่งพื้นฐาน


```
docker pull <REPOSTIROY:TAG>

docker run --rm <REPOSTIROY:TAG> COMMAND [ARGS..]
docker run --name <NAME> --rm -it <REPOSTIROY:TAG> /bin/sh
docker run --name <NAME> -d <REPOSTIROY:TAG> /bin/sh

docker exec -it <CONTAINER ID> /bin/sh

docker info
docker ps -a
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker container prune

docker images
docker rmi <IMAGE ID>
docker rmi $(docker images -qf "dangling=true")

docker volume ls -qf dangling=true
docker volume rm $(docker volume ls -qf "dangling=true")

docker inspect IMAGE_ID
docker inspect -f {{.Name}} - {{.NetworkSettings.IPAddress }} $(docker ps -aq)

docker network ls
```

### Export docker container to file

```
docker export -o <container-name.tar> <CONTAINER ID>
```

### Import file to create a filesystem image

```
docker import [OPTIONS] file|URL|- [REPOSITORY[:TAG]]
```

### Save docker image to file

```
docker save -o <image-name.tar> <IMAGE ID>
```

### Load docker image from file

```
docker load -i <image-name.tar>
```

### Tag image
```
docker tag <IMAGE ID> <REPOSTIROY:TAG>
```

### <a name="docker-compose"></a> Docker Compose

```
docker-compose (up|down|start|stop)
```

![](https://image.slidesharecdn.com/gemfire-docker-compose-jvm-meetup-2016-04-c-160914235800/95/automated-integration-testing-of-distributed-systems-with-docker-compose-and-junit-20-638.jpg?cb=1473898086)

![](https://www.the-captains-shack.com/images/refactoringAnsible/Kimsufi.png)

![](https://msdnshared.blob.core.windows.net/media/2016/10/ComposeFile.png)

## <a name="docker-advance"></a> การใช้ Docker ขั้นสูง

### Build image
### Docker Registry


## <a name="docker-reference"></a> อ้างอิง
- [ทำความรู้จัก Docker และ Software Container](https://goo.gl/p8OCIJ)
- [การใช้งาน Docker เบื้องต้น](https://goo.gl/yp27aw)
- [คอนเทนเนอร์ คืออะไร](https://sites.google.com/site/chanwit/blogs/what-is-container)
- [Docker คืออะไร?](https://www.softmelt.com/article.php?id=611)
- [สรุปการใช้งาน Docker ที่น่าจะดี](http://www.somkiat.cc/better-ways-with-docker/)
- [Use Docker Compose and Service Discovery on Windows to scale-out your multi-service container application](https://blogs.technet.microsoft.com/virtualization/2016/10/18/use-docker-compose-and-service-discovery-on-windows-to-scale-out-your-multi-service-container-application/)
