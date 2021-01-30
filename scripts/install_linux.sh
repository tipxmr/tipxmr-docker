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
    cd tipxmr-frontend
    npm install
    cd ..
else
    cd tipxmr-frontend
    git pull origin dockerize
    cd ..
fi
if [ ! -d "tipxmr-backend" ] ; then
    git clone -b dockerize https://github.com/hundehausen/tipxmr-backend.git
    cd tipxmr-backend
    npm install
    cd ..
else
    cd tipxmr-backend
    git pull origin dockerize 
    cd ..
fi
#wget -O ../projects/monero-node/bitmonero/block_tor.txt https://gui.xmr.pm/files/block_tor.txt
echo "Run cd .. && docker-compose up"