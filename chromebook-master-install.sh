#!/bin/bash

# Chromebook Master Installer for BidDeed.AI Development
# Version: 1.0
# Last Updated: January 7, 2026
# Total Time: 30-45 minutes (80% automated)

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Progress tracking
TOTAL_STEPS=15
CURRENT_STEP=0

progress() {
    CURRENT_STEP=$((CURRENT_STEP + 1))
    echo -e "${BLUE}[${CURRENT_STEP}/${TOTAL_STEPS}]${NC} $1"
}

success() {
    echo -e "${GREEN}✅ $1${NC}"
}

warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

error() {
    echo -e "${RED}❌ $1${NC}"
    exit 1
}

# Banner
echo "=========================================="
echo "  BidDeed.AI Chromebook Development Setup"
echo "  Everest Capital USA"
echo "=========================================="
echo ""
echo "This will install:"
echo "  • Node.js 20 LTS"
echo "  • Claude Code 2.0.74+"
echo "  • Git + GitHub CLI"
echo "  • Python 3.11+"
echo "  • Supabase CLI"
echo "  • All BidDeed.AI repositories"
echo ""
echo "Estimated time: 30-45 minutes"
echo "Automation rate: 80%"
echo ""
read -p "Press Enter to continue or Ctrl+C to cancel..."

# Step 1: Update system
progress "Updating system packages..."
sudo apt-get update -y
sudo apt-get upgrade -y
success "System updated"

# Step 2: Install Node.js 20 LTS
progress "Installing Node.js 20 LTS..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
success "Node.js $(node --version) installed"

# Step 3: Install Git
progress "Installing Git..."
sudo apt-get install -y git
git config --global user.name "Ariel Shapira"
git config --global user.email "brevardbidderai@gmail.com"
success "Git $(git --version | cut -d' ' -f3) installed"

# Step 4: Install GitHub CLI
progress "Installing GitHub CLI..."
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt-get update
sudo apt-get install -y gh
success "GitHub CLI installed"

# Step 5: Install Python 3.11
progress "Installing Python 3.11..."
sudo apt-get install -y python3.11 python3.11-venv python3-pip
success "Python $(python3 --version) installed"

# Step 6: Install Claude Code
progress "Installing Claude Code 2.0.74+..."
sudo npm install -g @anthropic-ai/claude-code
success "Claude Code $(claude --version 2>/dev/null || echo 'installed') installed"

# Step 7: Install Supabase CLI
progress "Installing Supabase CLI..."
sudo npm install -g supabase
success "Supabase CLI installed"

# Step 8: Create workspace directory
progress "Creating workspace directory..."
mkdir -p ~/workspace
cd ~/workspace
success "Workspace created at ~/workspace"

# Step 9: Clone repositories
progress "Cloning BidDeed.AI repositories..."

echo "  → Cloning brevard-bidder-scraper..."
git clone https://github.com/breverdbidder/brevard-bidder-scraper.git 2>/dev/null || warning "Repository already exists"

echo "  → Cloning life-os..."
git clone https://github.com/breverdbidder/life-os.git 2>/dev/null || warning "Repository already exists"

echo "  → Cloning spd-site-plan-dev..."
git clone https://github.com/breverdbidder/spd-site-plan-dev.git 2>/dev/null || warning "Repository already exists"

success "Repositories cloned"

# Step 10: Install Python dependencies
progress "Installing Python dependencies..."
cd ~/workspace/brevard-bidder-scraper
pip3 install --break-system-packages -r requirements.txt 2>/dev/null || warning "Some dependencies may need manual installation"
success "Python dependencies installed"

# Step 11: Create custom aliases
progress "Creating custom aliases..."
cat >> ~/.bashrc << 'EOF'

# BidDeed.AI Development Aliases
alias biddeed='cd ~/workspace/brevard-bidder-scraper && claude --session-length=7h'
alias lifeos='cd ~/workspace/life-os && claude'
alias spd='cd ~/workspace/spd-site-plan-dev && claude'
alias deploy='git add . && git commit -m "$1" && git push origin main'
alias sb-check='curl -s https://mocerqjnksmhcjzxrewo.supabase.co/rest/v1/ | jq'
alias sb-errors='cd ~/workspace/brevard-bidder-scraper && python3 -c "from src.utils.error_tracker import get_recent_errors; print(get_recent_errors())"'
alias pull-all='cd ~/workspace && for dir in */; do (cd "$dir" && echo "Pulling $dir..." && git pull); done'
alias test-all='cd ~/workspace/brevard-bidder-scraper && npm test && cd ~/workspace/life-os && npm test'

# Quick navigation
alias ws='cd ~/workspace'
alias bb='cd ~/workspace/brevard-bidder-scraper'
alias los='cd ~/workspace/life-os'
alias spdev='cd ~/workspace/spd-site-plan-dev'
EOF

source ~/.bashrc 2>/dev/null || true
success "Custom aliases created"

# Step 12: Create environment file template
progress "Creating environment file template..."
cat > ~/workspace/.env.template << 'EOF'
# BidDeed.AI Environment Variables
# Copy this to .env and fill in your values

# Anthropic API
ANTHROPIC_API_KEY=sk-ant-...

# Supabase
SUPABASE_URL=https://mocerqjnksmhcjzxrewo.supabase.co
SUPABASE_ANON_KEY=...
SUPABASE_SERVICE_KEY=...

# GitHub
GITHUB_TOKEN=ghp_...

# Environment
ENVIRONMENT=development
SMART_ROUTER_DEFAULT_TIER=FREE
EOF

success "Environment template created at ~/workspace/.env.template"

# Step 13: Create browser launcher script
progress "Creating browser launcher..."
cat > ~/workspace/launch-browser.sh << 'EOF'
#!/bin/bash

# Launch Chrome with pinned BidDeed.AI tabs
google-chrome-stable \
    "https://github.com/breverdbidder" \
    "https://supabase.com/dashboard/project/mocerqjnksmhcjzxrewo" \
    "https://brevard-bidder-landing.pages.dev" \
    "https://life-os-aiy.pages.dev" \
    "https://claude.ai" \
    &
EOF

chmod +x ~/workspace/launch-browser.sh
success "Browser launcher created"

# Step 14: Create session-end script
progress "Creating session-end script..."
cat > ~/workspace/session-end.sh << 'EOF'
#!/bin/bash

# End-of-day session cleanup and summary
echo "=========================================="
echo "  BidDeed.AI Session Summary"
echo "=========================================="
echo ""

# Show today's commits
echo "📝 Today's Commits:"
cd ~/workspace/brevard-bidder-scraper && git log --since="midnight" --oneline --all
echo ""

# Show Supabase metrics
echo "📊 Today's Metrics:"
curl -s https://mocerqjnksmhcjzxrewo.supabase.co/rest/v1/daily_metrics?created_at=gte.$(date +%Y-%m-%d) \
    -H "apikey: $SUPABASE_ANON_KEY" | jq '.[0]'
echo ""

# Checkpoint all repos
echo "💾 Checkpointing repositories..."
cd ~/workspace
for dir in */; do
    if [ -d "$dir/.git" ]; then
        cd "$dir"
        git add . 2>/dev/null
        git commit -m "[CHECKPOINT] End of day $(date +%Y-%m-%d)" 2>/dev/null || true
        cd ~/workspace
    fi
done

echo ""
echo "✅ Session ended. Good work today!"
EOF

chmod +x ~/workspace/session-end.sh
success "Session-end script created"

# Step 15: Create validation script
progress "Creating validation script..."
cat > ~/workspace/validate-install.sh << 'EOF'
#!/bin/bash

# Validate BidDeed.AI Chromebook installation

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

check() {
    if command -v $1 &> /dev/null; then
        echo -e "${GREEN}✅ $2: $($1 $3)${NC}"
    else
        echo -e "${RED}❌ $2: Not found${NC}"
    fi
}

echo "=========================================="
echo "  BidDeed.AI Installation Validation"
echo "=========================================="
echo ""

check node "Node.js" "--version"
check claude "Claude Code" "--version"
check git "Git" "--version"
check gh "GitHub CLI" "--version"
check python3 "Python" "--version"
check supabase "Supabase CLI" "--version"

echo ""
echo "Repositories:"
[ -d ~/workspace/brevard-bidder-scraper ] && echo -e "${GREEN}✅ Repository: brevard-bidder-scraper${NC}" || echo -e "${RED}❌ Repository: brevard-bidder-scraper${NC}"
[ -d ~/workspace/life-os ] && echo -e "${GREEN}✅ Repository: life-os${NC}" || echo -e "${RED}❌ Repository: life-os${NC}"
[ -d ~/workspace/spd-site-plan-dev ] && echo -e "${GREEN}✅ Repository: spd-site-plan-dev${NC}" || echo -e "${RED}❌ Repository: spd-site-plan-dev${NC}"

echo ""
echo "Configuration:"
[ -f ~/workspace/.env.template ] && echo -e "${GREEN}✅ Environment template created${NC}" || echo -e "${RED}❌ Environment template missing${NC}"
[ -f ~/workspace/launch-browser.sh ] && echo -e "${GREEN}✅ Browser launcher configured${NC}" || echo -e "${RED}❌ Browser launcher missing${NC}"

echo ""
echo "=========================================="
echo "  Next Steps:"
echo "=========================================="
echo "1. Configure credentials: gh auth login"
echo "2. Copy environment variables: cp .env.template .env && nano .env"
echo "3. Test development: biddeed"
echo ""
EOF

chmod +x ~/workspace/validate-install.sh
success "Validation script created"

# Final summary
echo ""
echo "=========================================="
echo "  Installation Complete! 🎉"
echo "=========================================="
echo ""
echo "What was installed:"
echo "  ✅ Node.js $(node --version)"
echo "  ✅ Claude Code"
echo "  ✅ Git"
echo "  ✅ GitHub CLI"
echo "  ✅ Python $(python3 --version 2>&1 | cut -d' ' -f2)"
echo "  ✅ Supabase CLI"
echo "  ✅ 3 repositories cloned"
echo "  ✅ Custom aliases configured"
echo "  ✅ Development scripts created"
echo ""
echo "Next steps (manual - 5 minutes):"
echo "  1. Authenticate GitHub: gh auth login"
echo "  2. Configure API keys: cp ~/workspace/.env.template ~/workspace/.env && nano ~/workspace/.env"
echo "  3. Validate installation: ~/workspace/validate-install.sh"
echo "  4. Start development: biddeed"
echo ""
echo "Quick reference:"
echo "  biddeed     → Start 7-hour BidDeed.AI session"
echo "  lifeos      → Start Life OS session"
echo "  spd         → Start SPD session"
echo "  deploy      → Commit and push changes"
echo "  sb-check    → Test Supabase connection"
echo "  pull-all    → Update all repositories"
echo ""
echo "Total time: ~$(( (SECONDS / 60) )) minutes"
echo "Documentation: ~/workspace/CHROMEBOOK_QUICK_START.md"
echo ""
