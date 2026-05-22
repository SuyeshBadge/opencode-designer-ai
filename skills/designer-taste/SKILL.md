---
name: designer-taste
description: Always-loaded taste guardrails for the design team. Filters out generic AI aesthetics, enforces premium design principles, and blocks anti-patterns before they reach code. Use with EVERY design task as a mandatory quality baseline.
---

# Designer Taste — Mandatory Quality Baseline

These taste rules apply to ALL design work produced by this team, regardless of which agent or model executes the task.

## Zero-Tolerance Anti-Patterns (BLOCK THESE)

If any output contains these, it fails QA automatically:

### Typography
- **Inter**, **Roboto**, **Arial**, **Open Sans**, **Helvetica** as primary display/heading fonts (acceptable only for fallback body text)
- Default system font stacks without intentional choice
- Monospace fonts used for body text without purpose

### Color
- Default Tailwind palette colors (gray-50, blue-500, etc.) without intentional modification
- Purple gradients (specifically `#8B5CF6` adjacency — the generic "AI purple")
- Harsh black shadows (`rgba(0,0,0,0.3)` or darker)
- Flat colors without any depth or texture treatment

### Layout
- Symmetrical 3-column grids without massive whitespace gaps
- Edge-to-edge sticky navbars glued to the top with no visual breathing room
- Bootstrap-style container → row → col nesting patterns
- Content that doesn't respond to viewport changes

### Motion
- Default `ease` or `ease-in-out` timing functions in CSS animations
- Instant state changes with no interpolation
- `animation-duration: 0.3s` or `0.2s` everywhere — vary timing by purpose
- Missing `prefers-reduced-motion` support

## Premium Defaults

When no specific design direction is given, lean into these:

### Fonts (in order of preference)
- **Display/Headings**: Geist, Clash Display, PP Editorial New, Satoshi, Plus Jakarta Sans
- **Body**: Inter (fine for body), Sonne, ABC Favorit
- **Mono**: JetBrains Mono, Geist Mono, SF Mono

### Colors
- Warm neutrals over cool grays for brand surfaces
- Muted, desaturated accents with one vibrant pop color
- Light mode: off-white backgrounds (#F8F5F0 — #FAFAF8), not pure white (#FFFFFF)
- Dark mode: true dark (#0A0A0A — #121212), not dark gray (#1E1E1E)

### Spacing
- 8px base scale (8, 16, 24, 32, 48, 64, 96, 128)
- Generous whitespace — if something feels cramped, double the spacing

## Quality Checklist (Every Output Must Pass)

Before delivering any design output, verify:
- [ ] Not using any zero-tolerance anti-pattern fonts
- [ ] Not using default/tailwind colors without modification
- [ ] Not using symmetrical boring layouts
- [ ] Animations have custom easing and are purposeful
- [ ] Responsive behavior is implemented, not an afterthought
- [ ] Dark mode is considered (even if not implemented in full)
- [ ] Accessibility: color contrast meets WCAG AA (4.5:1 normal text, 3:1 large)
- [ ] Every visual choice has intentional reasoning behind it
