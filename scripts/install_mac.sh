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
    git clone -b dockerize https://github.com/hundehausen/tipxmr.git tipxmr-frontend
else
    cd tipxmr-frontend
    git pull git pull origin dockerize
    cd ..
fi
if [ ! -d "tipxmr-backend" ] ; then
    git clone -b dockerize https://github.com/hundehausen/tipxmr-backend.git
else
    cd tipxmr-backend
    git pull origin git clone -b dockerize 
    cd ..
fi
echo "Run docker-compose up"