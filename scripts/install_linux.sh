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

if ! git version >/dev/null 2>&1; then
    echo "git is not installed.. sudo apt install -y git"
    exit 1
fi

mkdir -p ../projects
cd ../projects
if [ ! -d "tipxmr-frontend" ] ; then
    git clone https://github.com/hundehausen/tipxmr.git tipxmr-frontend
    cd tipxmr-frontend
    git checkout dockerize
    cd ..
else
    cd tipxmr-frontend
    git pull https://github.com/hundehausen/tipxmr.git
    git checkout dockerize
    cd ..
fi
if [ ! -d "tipxmr-backend" ] ; then
    git clone https://github.com/hundehausen/tipxmr-backend.git
    cd tipxmr-backend
    git checkout dockerize
    cd ..
else
    cd tipxmr-backend
    git pull https://github.com/hundehausen/tipxmr-backend.git
    git checkout dockerize
    cd ..
fi