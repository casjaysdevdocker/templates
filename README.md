# Docker

##### extrnal database
```bash
sudo docker run -d \
--name=template \
-p 8080:8080 \
-p 5000:5000 \
-p 27017:27017 \
-e TZ=America/New_York \
--restart unless-stopped \
dockerizegit/template  
```

##### enable internal database
```bash
sudo docker run -d \
--name=template \
-p 8080:8080 \
-p 5000:5000 \
-p 27017:27017 \
-v /var/lib/docker/storage/mongodb/template:/data/db \
-e TZ=America/New_York \
-e MONGDB=localhost \
--restart unless-stopped \
dockerizegit/template  
```
