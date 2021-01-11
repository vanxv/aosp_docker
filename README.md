
```
git clone https://github.com/vanxv/aosp_builder_docker.git
cd aosp_builder_docker
docker build -t aosp_builder:V1.0 .

docker run -it -v /Volumes/untitled:/home aosp_builder:V1.0
docker exec -it container_name /bin/sh

```