#!/bin/bash
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

BLUEPRINT_REPO="https://github.com/trsdn/github-copilot-agent.git"
TEMP_DIR=$(mktemp -d)

echo -e "${BLUE}╔════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  GitHub Copilot Customizations Blueprint Installer ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════╝${NC}"
echo ""

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${RED}✗ Error: Not in a git repository${NC}"
    echo "Please run this script from within a git repository."
    exit 1
fi

echo -e "${GREEN}✓ Git repository detected${NC}"
echo ""

# Ask user what to install
echo -e "${YELLOW}What would you like to install?${NC}"
echo "  1) Everything (agents, prompts, skills)"
echo "  2) Agents only"
echo "  3) Prompts only"
echo "  4) Skills only"
echo "  5) Custom selection"
read -p "Enter choice [1-5]: " choice

# Initialize flags
INSTALL_AGENTS=false
INSTALL_PROMPTS=false
INSTALL_SKILLS=false

case $choice in
    1)
        INSTALL_AGENTS=true
        INSTALL_PROMPTS=true
        INSTALL_SKILLS=true
        ;;
    2)
        INSTALL_AGENTS=true
        ;;
    3)
        INSTALL_PROMPTS=true
        ;;
    4)
        INSTALL_SKILLS=true
        ;;
    5)
        read -p "Install agents? (y/n): " answer
        [[ $answer =~ ^[Yy]$ ]] && INSTALL_AGENTS=true
        
        read -p "Install prompts? (y/n): " answer
        [[ $answer =~ ^[Yy]$ ]] && INSTALL_PROMPTS=true
        
        read -p "Install skills? (y/n): " answer
        [[ $answer =~ ^[Yy]$ ]] && INSTALL_SKILLS=true
        ;;
    *)
        echo -e "${RED}✗ Invalid choice${NC}"
        exit 1
        ;;
esac

echo ""
echo -e "${BLUE}📦 Fetching Copilot customizations blueprint...${NC}"

# Clone the blueprint repository
if ! git clone --depth 1 "$BLUEPRINT_REPO" "$TEMP_DIR" 2>/dev/null; then
    echo -e "${RED}✗ Failed to fetch blueprint repository${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Blueprint fetched successfully${NC}"
echo ""

# Create directories
echo -e "${BLUE}📁 Creating directories...${NC}"
mkdir -p .github/agents
mkdir -p .github/prompts
mkdir -p .github/skills

# Install components
INSTALLED_COUNT=0

if [ "$INSTALL_AGENTS" = true ]; then
    echo -e "${BLUE}→ Installing agents...${NC}"
    if cp -r "$TEMP_DIR/.github/agents/"* .github/agents/ 2>/dev/null; then
        COUNT=$(find "$TEMP_DIR/.github/agents/" -name "*.agent.md" | wc -l | xargs)
        echo -e "${GREEN}  ✓ Installed $COUNT agent(s)${NC}"
        INSTALLED_COUNT=$((INSTALLED_COUNT + COUNT))
    else
        echo -e "${YELLOW}  ⚠ No agents found in blueprint${NC}"
    fi
fi

if [ "$INSTALL_PROMPTS" = true ]; then
    echo -e "${BLUE}→ Installing prompts...${NC}"
    if cp -r "$TEMP_DIR/.github/prompts/"* .github/prompts/ 2>/dev/null; then
        COUNT=$(find "$TEMP_DIR/.github/prompts/" -name "*.prompt.md" | wc -l | xargs)
        echo -e "${GREEN}  ✓ Installed $COUNT prompt(s)${NC}"
        INSTALLED_COUNT=$((INSTALLED_COUNT + COUNT))
    else
        echo -e "${YELLOW}  ⚠ No prompts found in blueprint${NC}"
    fi
fi

if [ "$INSTALL_SKILLS" = true ]; then
    echo -e "${BLUE}→ Installing skills...${NC}"
    if cp -r "$TEMP_DIR/.github/skills/"* .github/skills/ 2>/dev/null; then
        COUNT=$(find "$TEMP_DIR/.github/skills/" -name "SKILL.md" | wc -l | xargs)
        echo -e "${GREEN}  ✓ Installed $COUNT skill(s)${NC}"
        INSTALLED_COUNT=$((INSTALLED_COUNT + COUNT))
    else
        echo -e "${YELLOW}  ⚠ No skills found in blueprint${NC}"
    fi
fi

# Cleanup
rm -rf "$TEMP_DIR"

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  ✓ Installation Complete!             ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════╝${NC}"
echo ""
echo -e "${BLUE}Installed $INSTALLED_COUNT customization(s)${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Review the installed files in .github/"
echo "  2. Open VS Code and reload the window"
echo "  3. Open Copilot Chat and test your customizations"
echo "  4. Commit the changes: git add .github && git commit -m 'feat: add copilot customizations'"
echo ""
echo -e "${BLUE}Documentation:${NC} https://github.com/trsdn/github-copilot-agent#readme"
echo ""
echo -e "${GREEN}Happy coding with Copilot! 🚀${NC}"
