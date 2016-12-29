docker rm -fv onjobs-proxy-docker
docker build -t onjobs-proxy-docker .
docker run -d --privileged=true --name onjobs-ssl-proxy -e CERTS=onjobs.xpectrumtech.com -e EMAIL=onjobs@xpectrumtech.com -v /etc/letsencrypt:/etc/letsencrypt --link onjobs-rest-api-8084 -p 80:80 -p 444:444 onjobs-proxy-docker