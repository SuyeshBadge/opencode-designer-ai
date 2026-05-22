#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
OPENCODE_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/opencode"
OPENCODE_AGENTS_DIR="$OPENCODE_CONFIG_DIR/agents"
OPENCODE_SKILLS_DIR="$OPENCODE_CONFIG_DIR/skills"
OPENCODE_SRC_DIR="$REPO_DIR"

# ─── Colors ────────────────────────────────────────────────────────────────
BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

info()  { echo -e "${BLUE}${BOLD}◆${NC} $1"; }
ok()    { echo -e "${GREEN}${BOLD}✔${NC} $1"; }
warn()  { echo -e "${YELLOW}${BOLD}⚠${NC} $1"; }
fail()  { echo -e "${RED}${BOLD}✘${NC} $1"; exit 1; }

# ─── Header ─────────────────────────────────────────────────────────────────
echo ""
echo -e "${BOLD}  OpenCode Designer AI — One-Click Setup${NC}"
echo ""

# ─── 1. Check prerequisites ────────────────────────────────────────────────
info "Checking prerequisites..."

if ! command -v opencode &>/dev/null; then
  fail "opencode not found. Install it first: https://opencode.ai/docs"
fi
ok "opencode found: $(opencode --version 2>&1 | head -1)"

if ! command -v npx &>/dev/null; then
  fail "npx not found. Install Node.js first."
fi
ok "npx found"

if ! opencode models 2>/dev/null | grep -q "opencode-go"; then
  warn "opencode-go provider not detected."
  warn "Run 'opencode auth' and connect your opencode-go account: https://opencode.ai/go"
  echo ""
  read -rp "  Continue anyway? (Y/n) " yn
  yn=${yn:-Y}
  if [[ "$yn" =~ ^[Nn] ]]; then exit 1; fi
else
  ok "opencode-go provider found"
fi

# ─── 2. Install external skills from skills.sh ─────────────────────────────
echo ""
info "Installing external skills from skills.sh..."

SKILL_REPOS=(
  "https://github.com/anthropics/skills"
  "https://github.com/vercel-labs/agent-skills"
  "https://github.com/nextlevelbuilder/ui-ux-pro-max-skill"
  "https://github.com/pbakaus/impeccable"
  "https://github.com/leonxlnx/taste-skill"
  "https://github.com/emilkowalski/skill"
  "https://github.com/vercel-labs/agent-browser"
  "https://github.com/obra/superpowers"
  "https://github.com/vercel-labs/skills"
  "https://github.com/anthropics/skills"
  "https://github.com/chiroro-jr/pencil-design-skill"
)

SKILL_NAMES=(
  "frontend-design"
  "web-design-guidelines"
  "ui-ux-pro-max"
  "impeccable"
  "high-end-visual-design"
  "emil-design-eng"
  "agent-browser"
  "brainstorming"
  "find-skills"
  "canvas-design"
  "pencil-design"
)

for i in "${!SKILL_REPOS[@]}"; do
  echo -n "  ${SKILL_NAMES[$i]} ... "
  if [ -d "$HOME/.agents/skills/${SKILL_NAMES[$i]}" ]; then
    echo -e "${GREEN}already installed${NC}"
  else
    npx -y skills add "${SKILL_REPOS[$i]}" --skill "${SKILL_NAMES[$i]}" --yes 2>/dev/null && \
      echo -e "${GREEN}installed${NC}" || \
      echo -e "${YELLOW}skipped (may need retry)${NC}"
  fi
done

# ─── 3. Create directories ─────────────────────────────────────────────────
info "Setting up config directories..."
mkdir -p "$OPENCODE_AGENTS_DIR" "$OPENCODE_SKILLS_DIR"

# ─── 4. Copy agent files ───────────────────────────────────────────────────
info "Installing agent definitions..."
for agent in "$OPENCODE_SRC_DIR"/agents/*.md; do
  name=$(basename "$agent")
  cp "$agent" "$OPENCODE_AGENTS_DIR/$name"
  ok "  agents/$name"
done

# ─── 5. Copy custom skills ─────────────────────────────────────────────────
info "Installing custom skills..."
for skill_dir in "$OPENCODE_SRC_DIR"/skills/*/; do
  name=$(basename "$skill_dir")
  mkdir -p "$OPENCODE_SKILLS_DIR/$name"
  cp -r "$skill_dir"/* "$OPENCODE_SKILLS_DIR/$name/"
  ok "  skills/$name"
done

# ─── 6. Merge opencode.json ────────────────────────────────────────────────
echo ""
info "Merging opencode.json config..."

CONFIG_TARGET="$OPENCODE_CONFIG_DIR/opencode.json"

# Backup existing config
if [ -f "$CONFIG_TARGET" ]; then
  cp "$CONFIG_TARGET" "$CONFIG_TARGET.bak.$(date +%s)"
  ok "Backed up existing config to opencode.json.bak.*"
fi

# Merge config with placeholder resolution
TMP_CONFIG=$(mktemp)
sed -e "s|__SKILLS_DIR__|$OPENCODE_SKILLS_DIR|g" \
    -e "s|__AGENTS_DIR__|$OPENCODE_AGENTS_DIR|g" \
    "$OPENCODE_SRC_DIR/opencode.json" > "$TMP_CONFIG"

if command -v jq &>/dev/null; then
  if [ -f "$CONFIG_TARGET" ]; then
    jq -s '.[0] * .[1]' "$TMP_CONFIG" "$CONFIG_TARGET" > "$CONFIG_TARGET.tmp" && \
      mv "$CONFIG_TARGET.tmp" "$CONFIG_TARGET"
    ok "Config merged (jq). Your existing MCP/providers preserved."
  else
    cp "$TMP_CONFIG" "$CONFIG_TARGET"
    ok "Config created."
  fi
else
  cp "$TMP_CONFIG" "$CONFIG_TARGET"
  warn "jq not found — installed base config with placeholder resolved."
  warn "If you have existing MCP servers, manually merge them into:"
  warn "  $CONFIG_TARGET"
fi
rm -f "$TMP_CONFIG"

# ─── 7. Done ────────────────────────────────────────────────────────────────
echo ""
echo -e "${GREEN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}${BOLD}  Setup complete!${NC}"
echo -e "${GREEN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "  Your design team is ready:"
echo -e "    ${BOLD}design-director${NC}     (Kimi K2.6)    — orchestrator/POC"
echo -e "    ${BOLD}visual-designer${NC}     (Kimi K2.6)    — creative vision"
echo -e "    ${BOLD}ux-architect${NC}        (DeepSeek V4 Pro)  — structure & specs"
echo -e "    ${BOLD}design-researcher${NC}    (DeepSeek V4 Pro)  — research & trends"
echo -e "    ${BOLD}frontend-crafter${NC}    (DeepSeek V4 Flash) — code implementation"
echo -e "    ${BOLD}design-critic${NC}       (DeepSeek V4 Flash) — QA & polish"
echo ""
echo -e "  ${YELLOW}Restart opencode for changes to take effect.${NC}"
echo ""
