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
git clone https://github.com/hundehausen/tipxmr.git
git clone https://github.com/hundehausen/tipxmr-backend.git
cd tipxmr
git checkout dockerize
cd ../tipxmr-backend
git checkout dockerize