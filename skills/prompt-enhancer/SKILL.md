---
name: prompt-enhancer
description: ALWAYS invoke this skill on ANY design request before dispatching agents. Transforms vague, underspecified, or poorly structured design requests into precise, actionable design briefs with clear aesthetic direction, technical constraints, target audience context, success criteria, and deliverable specifications. Triggers on ALL design-related user messages — "make it look good", "design a", "create a landing page", "build a dashboard", "make a component", "I need a", "create something", or literally any design request lacking exhaustive specificity. Do NOT skip this step even for "simple" requests.
---

# Prompt Enhancer

Transform vague design requests into precise, production-ready design briefs that specialized design agents can execute flawlessly.

## When to Activate

Use this skill when:
- User provides a brief or vague design request
- User says things like "make it look good", "design something modern", "create a nice UI"
- User requests a design without specifying aesthetic direction, audience, or constraints
- The prompt lacks sufficient context for a specialized design agent to produce high-quality output

## Enhancement Framework

When enhancing a prompt, apply the **DESIGN** framework:

### D - Define the Core
- **Purpose**: What problem does this design solve?
- **Product type**: SaaS, e-commerce, portfolio, dashboard, landing page, mobile app, etc.
- **Primary action**: What should users do? (sign up, buy, read, explore, etc.)

### E - Establish Aesthetic Direction
Choose a clear visual language from these archetypes (pick one dominant + one secondary):
- **Minimal/Editorial**: Clean typography, generous whitespace, muted palette, flat surfaces
- **Bold/Maximalist**: Strong visual weight, vibrant gradients, dramatic scale contrast
- **Premium/Luxury**: Refined details, subtle depth, sophisticated typography, haptic feel
- **Playful/Toy-like**: Rounded forms, bright colors, bouncy motion, friendly personality
- **Industrial/Brutalist**: Raw grids, monospace type, utilitarian aesthetic, data-forward
- **Retro-Futuristic**: Nostalgic references with modern execution, neon accents, geometric forms
- **Organic/Natural**: Soft shapes, earth tones, natural textures, flowing compositions

### S - Specify the Audience
- Who is the primary user? (demographics, tech-savviness, expectations)
- What is their mental model? What do they expect from this type of interface?
- What emotional response should the design evoke?

### I - Identify Constraints
- **Platform**: Web, mobile (iOS/Android), desktop, responsive
- **Framework**: React, Next.js, Vue, vanilla HTML/CSS, etc.
- **Accessibility**: WCAG level, color contrast requirements
- **Performance**: Any loading or animation constraints

### G - Generate Success Criteria
- What does "good" look like? Define measurable quality markers
- What anti-patterns should be avoided? (generic AI aesthetics, cliched fonts, predictable layouts)
- Reference sites or brands that exemplify the desired quality level

### N - Note Deliverables
- What exactly should be produced? (component, full page, design system, prototype)
- What format? (code, mockup description, design tokens, wireframe)
- What level of fidelity? (lo-fi, hi-fi, production-ready code)

## Output Format

After enhancement, produce a structured brief:

```
## Enhanced Design Brief

**Project**: [clear project name]
**Type**: [product/page/component type]
**Audience**: [target user description]

### Aesthetic Direction
- **Primary**: [chosen style with reasoning]
- **Secondary**: [supporting style elements]
- **Mood**: [3-5 descriptive adjectives]

### Technical Context
- **Platform**: [...]
- **Framework**: [...]
- **Constraints**: [...]

### Design Requirements
- **Typography**: [direction, not specific fonts unless specified]
- **Color**: [palette direction]
- **Layout**: [structural approach]
- **Motion**: [animation philosophy]

### Success Criteria
- [ ] [specific, measurable quality marker]
- [ ] [specific, measurable quality marker]

### Anti-Patterns to Avoid
- [specific things to NOT do]

### Deliverables
- [exact output expected]
```

## Rules

1. **Never** add constraints the user didn't imply - only clarify and structure
2. **Always** maintain the user's original intent - enhancement is about precision, not redirection
3. **Always** suggest an aesthetic direction if none was given, but mark it as a recommendation
4. **Never** enhance into implementation - the brief is input for specialized agents
5. **If the prompt is already specific**, only lightly structure it without adding assumptions
