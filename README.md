# TipXMR Docker

Dockerize TipXMR for development and production

## Installation

### Dependencies

- git
- docker
- docker-compose

```bash
git clone git@github.com:tipxmr/tipxmr-docker.git 
cd tipxmr-docker/scripts
./install_linux.sh
docker-compose up
```

Then open [http://localhost:8080](http://localhost:8080) in your browser.

### Fixing the permission issue
in case you run into a permission issue with docker, try the following command `sudo setfacl --modify user:$USER:rw /var/run/docker.sock`
