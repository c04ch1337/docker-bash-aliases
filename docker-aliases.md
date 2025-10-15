# =============================================
# 🐳 DOCKER ALIASES - Quick Command Shortcuts
# =============================================

# 🔍 VIEW & MONITORING ALIASES
alias show-containers='docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
alias show-running='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
alias show-images='docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}\t{{.CreatedSince}}"'
alias show-volumes='docker volume ls'
alias show-networks='docker network ls --filter type=custom'
alias show-ports='netstat -tulpn | grep docker || echo "No Docker ports found" && docker ps --format "table {{.Names}}\t{{.Ports}}"'

# 🚀 QUICK ACTIONS
alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcr='docker-compose restart'
alias dcl='docker-compose logs -f'
alias dcp='docker-compose ps'

# 🧹 CLEANUP ALIASES
alias docker-stop-all='docker stop $(docker ps -aq)'
alias docker-rm-all='docker rm $(docker ps -aq)'
alias docker-rmi-all='docker rmi $(docker images -q)'
alias docker-clean='docker system prune -af'
alias docker-clean-volumes='docker volume prune -f'
alias docker-nuke='docker system prune -a --volumes -f'

# 📊 INSPECTION ALIASES
alias docker-stats='docker stats --no-stream'
alias docker-top='docker stats'
alias docker-df='docker system df'
alias docker-events='docker events --since="1h"'

# 🔧 CONTAINER MANAGEMENT
alias docker-shell='docker exec -it'
alias docker-logs='docker logs -f'
alias docker-inspect='docker inspect'
alias docker-restart='docker restart'

# 🐛 DEBUGGING ALIASES
alias docker-ps-format='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}"'
alias docker-ips='docker ps -q | xargs -n 1 docker inspect --format "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}} {{.Name}}" | sed "s/ \// /"'
alias docker-env='docker exec -it $1 env | sort'

# 🎯 PROJECT SPECIFIC
alias docker-project-ps='docker ps --filter "label=com.docker.compose.project" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias docker-project-ls='docker ps --filter "label=com.docker.compose.project" --format "{{.Labels}}" | grep com.docker.compose.project | cut -d= -f2 | sort | uniq'

# 🚨 EMERGENCY STOP
alias docker-panic='docker stop $(docker ps -q) && echo "All containers stopped"'

# 🔍 ADVANCED MONITORING
alias docker-metrics='echo "=== CONTAINERS ===" && docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.RunningFor}}" && echo -e "\n=== IMAGES ===" && docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}" && echo -e "\n=== VOLUMES ===" && docker volume ls && echo -e "\n=== NETWORKS ===" && docker network ls --filter type=custom'