---
description: Anti-patterns to avoid and examples of optimal AI-optimized markdown
---

# Markdown AI-Parsing Patterns

## When to Use AI-Optimized Markdown

- **Automation Scripts**: Markdown files parsed by Python/Node scripts
- **AI-to-AI Communication**: Passing structured information between AI systems
- **Specification Documents**: Technical specs where precision is critical
- **Logging and Records**: Machine-readable logs with structured format

## When to Use Human-Readable Markdown

- **User Documentation**: Guides intended for human readers
- **README Files**: Project introductions and getting-started guides
- **Meeting Notes**: Flexible capture of ideas and discussions

## Comparison Table

| Aspect | AI-Optimized | Human-Readable |
|--------|--------------|----------------|
| Emojis | Minimal/eliminated | Encouraged |
| Whitespace | Minimal | Generous |
| Emphasis | Bold only for keywords | Bold, italics, decorative |
| Lists | Strict consistency | Flexible markers |
| Redundancy | Eliminated | Acceptable |

## Robust AI Instruction Patterns

### Atomic Steps
- One action per step
- **Bad**: "Create file and write content."
- **Good**: "1. Create file. 2. Write content."

### Explicit Verification
- Mandate verification after every state-changing action
- Example: "Run `ls` to confirm file creation."

### Idempotent Commands
- Use commands safe to re-run
- **Bad**: `mkdir dir` (fails if exists)
- **Good**: `mkdir -p dir`

### Atomic Writes
- Write to temporary file → Move to final path
- Prevents partial file corruption on interrupt

## Anti-Patterns (Avoid)

| Pattern | Problem |
|---------|---------|
| `***bold italic***` | Mixed emphasis, unparseable |
| Mixed list markers (`-`, `*`, `+`) | Inconsistent |
| Multiple blank lines | Excessive whitespace |
| Skipped heading levels | Breaks hierarchy |
| Scattered inline links | Hard to extract |

## Decision Framework

- **Audience: AI Systems** → AI-Optimized
- **Audience: Humans** → Human-Readable
- **Mixed Audience** → Err toward human-readable

---

## Related Documents

| Document | Purpose |
|:---------|:--------|
| [markdown-ai-parsing-basics.md](markdown-ai-parsing-basics.md) | Core AI parsing principles |
| [markdown-readability.md](markdown-readability.md) | Human-readable formatting |
