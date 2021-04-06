# Check if docker is running
if ! docker info >/dev/null 2>&1; then
    echo "Docker does not seem to be running, run it first and retry"
    exit 1
else
    echo "Docker running.."
fi

if ! docker-compose version >/dev/null 2>&1; then
    echo "Docker Compose does not seem to be running, run it first and retry"
    exit 1
else
    echo "Docker Compose running.."
fi

mkdir -p ../projects
cd ../projects
if [ ! -d "tipxmr-frontend" ] ; then
    git clone https://github.com/hundehausen/tipxmr.git tipxmr-frontend
else
    cd tipxmr-frontend
    git pull
    cd ..
fi
if [ ! -d "tipxmr-backend" ] ; then
    git clone https://github.com/hundehausen/tipxmr-backend.git
    cp ./tipxmr-backend/.env.example ./tipxmr-backend/.env
else
    cd tipxmr-backend
    git pull
    cd ..
fi
cd ..
export COMPOSE_DOCKER_CLI_BUILD=1 
export DOCKER_BUILDKIT=1 
docker-compose build

echo "Run docker-compose up"