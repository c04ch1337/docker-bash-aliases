# Create installation script
cat > install-docker-aliases.sh << 'EOF'
#!/bin/bash

echo "🐳 Installing Docker Aliases..."

# Backup existing bashrc
cp ~/.bashrc ~/.bashrc.backup.$(date +%Y%m%d_%H%M%S)

# Create docker aliases file
cat >> ~/.docker-aliases << 'DOCKER_ALIASES'

# =============================================
# 🐳 DOCKER ALIASES - Quick Command Shortcuts
# =============================================

# 🔍 VIEW & MONITORING
alias show-containers='docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
alias show-running='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
alias show-images='docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}\t{{.CreatedSince}}"'
alias show-volumes='docker volume ls'
alias show-networks='docker network ls'
alias show-ports='echo "=== Docker Ports ===" && docker ps --format "table {{.Names}}\t{{.Ports}}" && echo -e "\n=== System Ports ===" && netstat -tulpn | grep docker | head -10'

# 🚀 QUICK ACTIONS
alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcr='docker-compose restart'
alias dcl='docker-compose logs -f'
alias dcp='docker-compose ps'
alias dcb='docker-compose build'

# 🧹 CLEANUP
alias docker-stop-all='docker stop $(docker ps -aq) 2>/dev/null || echo "No containers to stop"'
alias docker-rm-all='docker rm $(docker ps -aq) 2>/dev/null || echo "No containers to remove"'
alias docker-rmi-dangling='docker image prune -f'
alias docker-clean='docker system prune -af'
alias docker-nuke='docker system prune -a --volumes -f'

# 📊 INSPECTION
alias docker-stats='docker stats --no-stream'
alias docker-top='docker stats'
alias docker-df='docker system df'

# 🔧 CONTAINER MANAGEMENT
alias docker-logs='docker logs -f'
alias docker-exec='docker exec -it'

# 🎯 DOCKER COMPOSE PROJECTS
alias docker-project-ps='docker ps --filter "label=com.docker.compose.project" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'

DOCKER_ALIASES

# Add to bashrc if not already there
if ! grep -q "docker-aliases" ~/.bashrc; then
    echo "" >> ~/.bashrc
    echo "# Load Docker aliases" >> ~/.bashrc
    echo "if [ -f ~/.docker-aliases ]; then" >> ~/.bashrc
    echo "    . ~/.docker-aliases" >> ~/.bashrc
    echo "fi" >> ~/.bashrc
fi

# Reload bashrc
source ~/.bashrc

echo "✅ Docker aliases installed successfully!"
echo "🔧 Reloaded: source ~/.bashrc"
echo "📚 Usage: show-containers, show-images, show-volumes, etc."
EOF

chmod +x install-docker-aliases.sh
./install-docker-aliases.sh