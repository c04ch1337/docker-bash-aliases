# 🐳 Docker Aliases Cheat Sheet

## 🔍 VIEWING
show-containers    # All containers (formatted)
show-running      # Running containers only
show-images       # All Docker images
show-volumes      # Docker volumes
show-ports        # Ports used by Docker
show-networks     # Docker networks

## 🚀 DOCKER COMPOSE
dcu               # docker-compose up -d
dcd               # docker-compose down
dcl               # docker-compose logs -f
dcp               # docker-compose ps
dcr               # docker-compose restart

## 🧹 CLEANUP
docker-stop-all   # Stop all containers
docker-rm-all     # Remove all containers
docker-clean      # System prune
docker-nuke       # Nuclear cleanup

## 📊 MONITORING
docker-stats      # Container statistics
docker-df         # Disk usage
docker-metrics    # Full overview

## 🔧 MANAGEMENT
docker-logs       # Follow logs
docker-exec       # Exec into container

## 🎯 PROJECTS
docker-project-ps # Show compose projects

## 🎯 Pro Tips
Make it permanent: The aliases will load every time you open a new terminal
Customize: Edit ~/.docker-aliases to add your own aliases
Backup: Your original .bashrc is backed up during installation
Test: Run show-containers to verify installation worked