echo "Creating Directories 📂"

mkdir -p ./config # Creates config directory for config in the current directory
mkdir -p $HOME/syncthing-data # Creates syncthing data directory in home directory

echo "Starting Syncthing 🎶"
docker-compose up -d # Starts syncthing in detached mode