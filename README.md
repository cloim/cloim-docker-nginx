# Customized nginx Server
Based on ([cloim/alpine](https://hub.docker.com/r/cloim/alpine/))

Default configuration file (default.conf) will be placed in /etc/conf.d/nginx
Default html will be placed in /var/www (index.html)

## Dockerfile links
* [latest](https://gitlab.com/cloim/docker-nginx)

# Examples
## Simple way
```
docker run -d -t \
           --name nginx \
           -p 80:80 \
           -p 443:443 \
           cloim/nginx
```

## Using local config, data
```
docker run -d -t \
           --name nginx \
           -p 80:80 \
           -p 443:443 \
           -v ~/Docker/Data/nginx/www:/var/www \
           -v ~/Docker/Data/nginx/log:/var/log \
           -v ~/Docker/Data/certs:/etc/certs \
           -v ~/Docker/Config/nginx:/etc/conf.d/nginx \
           cloim/nginx
```
