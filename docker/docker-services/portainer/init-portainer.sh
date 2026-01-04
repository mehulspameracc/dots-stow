echo "Creating Directories 📂"
mkdir -p ./data # Creates data directory for portainer in the current directory
mkdir -p ./config # Creates config directory for portainer in the current directory

echo "Starting Portainer ⚓"
docker-compose up -d # Starts portainer in detached mode