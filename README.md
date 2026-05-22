<div align="center">
  <img src="https://opencode.ai/favicon.svg" width="64" />
  <h1>OpenCode Designer AI</h1>
  <p><strong>Production-grade design team — one-click setup for opencode</strong></p>
  <p>
    <a href="#-setup"><code>bash setup.sh</code></a>
    ·
    <a href="#-team">Team</a>
    ·
    <a href="#-credit-optimized-workflow">Credit Chain</a>
    ·
    <a href="#-skills">Skills</a>
  </p>
  <br/>
</div>

A complete **designer AI team** for [opencode](https://opencode.ai). One orchestrator + 5 specialized agents, 15 skills, and a credit-optimized model chain — install once, never re-explain your design standards.

## One-Click Setup

```bash
git clone https://github.com/YOUR_USER/opencode-designer-ai.git
cd opencode-designer-ai
bash setup.sh
```

The script:
1. Installs all 11 external skills from [skills.sh](https://skills.sh)
2. Copies 6 agent definitions to `~/.config/opencode/agents/`
3. Copies 3 custom skills to `~/.config/opencode/skills/`
4. Merges the config (preserving your existing MCP servers)

**Prerequisites**: [opencode](https://opencode.ai/docs) installed with an [opencode-go](https://opencode.ai/go) subscription.

## Team

| Agent | Model | Role | Permission |
|-------|-------|------|------------|
| `design-director` | Kimi K2.6 | Orchestrator / POC — receives requests, delegates, delivers | edit: `.md`/`.json` only |
| `visual-designer` | Kimi K2.6 | Aesthetic vision, color, typography, motion | bash: deny |
| `ux-architect` | DeepSeek V4 Pro | IA, user flows, wireframes, accessibility | bash: deny |
| `design-researcher` | DeepSeek V4 Pro | Competitive analysis, trend research | edit: deny, bash: deny |
| `frontend-crafter` | DeepSeek V4 Flash | Production code (React, Next.js, Tailwind) | unrestricted |
| `design-critic` | DeepSeek V4 Flash | QA, accessibility audit, polish review | edit: deny, bash: deny |

## Credit-Optimized Workflow

```
Kimi K2.6 (1,150 req/5h)  →  DeepSeek V4 Pro (10,200 req/5h)  →  DeepSeek V4 Flash (31,650 req/5h)
  ↑ imagines & plans            ↑ decomposes into specs            ↑ executes & audits
  Most expensive                Mid cost                           Cheapest — bulk work
```

**Rules enforced in agents:**
- Kimi never does implementation (it's 27x more expensive than Flash)
- Flash never makes creative decisions (it's a precision executor)
- DeepSeek V4 Pro always breaks creative visions into granular specs before Flash touches them
- Prompt-enhancer is **mandatory** on every request (Phase 0)

## Skills

### External (installed from skills.sh)

| Skill | Source | Purpose |
|-------|--------|---------|
| `frontend-design` | anthropics/skills | Design patterns, visual polish |
| `web-design-guidelines` | vercel-labs/agent-skills | Standards compliance audits |
| `ui-ux-pro-max` | nextlevelbuilder/ui-ux-pro-max-skill | 50+ styles, 161 palettes, 99 UX guidelines |
| `impeccable` | pbakaus/impeccable | Polish, critique, audit, animate, adapt |
| `high-end-visual-design` | leonxlnx/taste-skill | Awwwards-tier premium aesthetics |
| `design-taste-frontend` | leonxlnx/taste-skill | Frontend taste rules, CSS enforcement |
| `emil-design-eng` | emilkowalski/skill | Animation craft, micro-interactions |
| `agent-browser` | vercel-labs/agent-browser | Web research, competitive analysis |
| `brainstorming` | obra/superpowers | Structured ideation |
| `writing-plans` | obra/superpowers | Implementation planning |
| `find-skills` | vercel-labs/skills | Dynamic skill discovery |
| `canvas-design` | anthropics/skills | Canvas-based design generation |
| `pencil-design` | chiroro-jr/pencil-design-skill | Pencil canvas visual mockups |

### Custom (bundled in this repo)

| Skill | Purpose |
|-------|---------|
| `prompt-enhancer` | Transforms vague requests into structured design briefs |
| `designer-taste` | Zero-tolerance anti-pattern enforcement (banned fonts, colors, layouts) |
| `frontend-design` | Design patterns and aesthetic guidance |

## File Structure

```
opencode-designer-ai/
├── setup.sh                         # One-click installer
├── opencode.json                    # Config template
├── agents/
│   ├── design-director.md           # POC orchestrator
│   ├── design-researcher.md         # Research analyst
│   ├── visual-designer.md           # Visual design lead
│   ├── ux-architect.md              # UX & IA specialist
│   ├── frontend-crafter.md          # Code implementation
│   └── design-critic.md             # QA & review
├── skills/
│   ├── prompt-enhancer/
│   │   └── SKILL.md                 # Prompt enhancement
│   ├── designer-taste/
│   │   └── SKILL.md                 # Taste guardrails
│   └── frontend-design/
│       ├── SKILL.md                 # Design patterns
│       └── LICENSE.txt
└── .gitignore
```

## Customizing for Your Project

1. Edit `agents/*.md` to add project-specific context (brand, product details)
2. Add a `PRODUCT.md` / `DESIGN.md` for the impeccable skill's [context loader](https://skills.sh/pbakaus/impeccable/impeccable)
3. Tweak `opencode.json` to add your MCP servers or change model assignments

## License

Apache 2.0 — see individual skill licenses for third-party components.
