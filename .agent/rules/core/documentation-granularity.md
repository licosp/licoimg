# Documentation Granularity Standards

## Purpose
Define optimal file and directory structure standards to maximize AI comprehension and maintain clarity in documentation.

## 1. File Size

### Recommended Range
- **Ideal**: 20-80 lines per file
- **Warning threshold**: 100+ lines
- **Split required**: 150+ lines

### Rationale
- Single concept coverage: Each file should comprehensively explain one concept
- Cognitive load: Entire content visible at a glance
- AI efficiency: Optimal context window utilization

### Decision Criteria
- ✅ Does the file have a single, clear responsibility?
- ✅ Can it be understood independently?
- ❌ Does it contain multiple unrelated concepts?

**Action**: Split files exceeding 150 lines into logical components.

---

## 2. File Naming

### Recommended Length
- **Preferred**: 10-25 characters (including `.md`)
- **Minimum acceptable**: 8 characters (e.g., `push.md`)
- **Maximum acceptable**: 30 characters

### Naming Patterns

#### Single Word (8-15 characters)
Use when directory context provides clarity:
- `identity.md`
- `commit.md`
- `localization.md`

#### Hyphenated 2-3 Words (16-30 characters)
Use when specificity is needed:
- `code-quality.md`
- `language-standards.md`
- `conversation-logging.md`

### Avoid
- **Abbreviations**: `conv-log.md`, `cont-imp.md` (unclear)
- **Redundancy**: `continuous-improvement-and-learning-guidelines.md` (too verbose)

### Decision Criteria
- ✅ Is the content clear from the filename?
- ✅ Is it readable at a glance?
- ✅ Does the directory path + filename provide full context?

---

## 3. Directory File Count

### Recommended Range
- **Ideal**: 3-7 files per directory
- **Warning threshold**: 10+ files
- **Reorganization needed**: 12+ files

### Rationale (Cognitive Science)
- **Miller's Law**: Human short-term memory holds 7±2 items
- Long lists increase cognitive load
- Categorization improves understanding

### Decision Criteria
- ✅ Are files logically grouped?
- ✅ Should a subdirectory be created for better organization?
- ❌ Are unrelated files mixed together?

**Action**: Create subdirectories when file count exceeds 10.

---

## 4. Directory Tree Depth

### Recommended Depth
- **Ideal**: 2-3 levels
- **Maximum acceptable**: 4 levels

### Examples

#### Optimal (2 levels)
```
.agent/rules/core/identity.md
```

#### Acceptable (3 levels)
```
.agent/rules/development/testing/unit-tests.md
```

#### Warning (4 levels)
```
.agent/rules/workflow/communication/logging/format.md
```

#### Avoid (5+ levels)
Deep nesting makes navigation difficult and increases cognitive load.

### Rationale
- **Too deep**: Navigation becomes cumbersome, mental model complexity increases
- **Too shallow**: Files scatter, poor organization
- **2-3 levels**: Balanced structure, clear hierarchy

### Decision Criteria
- ✅ Is the role clear from the path?
- ✅ Does each level represent a meaningful classification?
- ❌ Is the structure over-engineered?

---

## Decision Framework

### When to Split a File
1. File exceeds 150 lines
2. File contains multiple distinct responsibilities
3. Independent sections are frequently referenced separately

### When to Merge Files
1. Related files are always referenced together
2. Total combined size < 80 lines
3. Conceptual overlap is high

### When to Create a Subdirectory
1. Directory contains 10+ files
2. Clear subcategories emerge (e.g., `testing/`, `deployment/`)
3. Files share a common prefix (e.g., `git-commit.md`, `git-push.md` → `git/commit.md`, `git/push.md`)

### When to Flatten Directory Structure
1. Subdirectory contains only 1-2 files
2. Deep nesting (4+ levels) without clear benefit
3. Directory names are redundant with parent context

---

## Current Structure Reference

As of 2025-11-26, the `.agent/rules/` structure:

```
.agent/rules/
├── README.md (index)
├── core/ (4 files) ✓
├── development/ (6 files) ✓
├── projects/ (1 file) ⚠️
└── workflow/ (3 files) ✓

Total: 15 files (.md)
Depth: 2 levels ✓
```

**Status**: Current structure adheres to these standards.
