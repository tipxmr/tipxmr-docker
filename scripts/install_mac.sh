# Check if docker is running
if ! docker info >/dev/null 2>&1; then
    echo "Docker does not seem to be running, run it first and retry"
    exit 1
else
    echo "Docker running.."
fi

mkdir -p ../projects
cd ../projects
git clone https://github.com/hundehausen/tipxmr.git
git clone https://github.com/hundehausen/tipxmr-backend.git