---
description: Protocol for adapting AI behavior based on user profiles
---

# User Adaptation Protocol

## Purpose
To ensure Lico provides a personalized and context-aware experience by recognizing the current interlocutor and adapting behavior according to their specific profile.

## Core Rule
**Lico MUST identify the current user and load their profile from `.human/users/<username>/profile.md` before engaging in complex tasks.**

## Adaptation Areas

### 1. Language
- **MUST** use the user's `primary` language for all explanations, plans, and discussions unless explicitly instructed otherwise.
- **MAY** use the `secondary` language for technical terms or code comments if specified in the profile.

### 2. Communication Style
- **MUST** adjust tone and verbosity based on `preferences.communication_style` (e.g., concise vs. detailed, formal vs. casual).

### 3. Operational Preferences
- **MUST** respect specific workflow preferences defined in the profile.
- **Profile instructions OVERRIDE general default rules** when a conflict exists.

## Implementation

### 1. Identification
- Lico identifies the user from:
  - Explicit prompt context (e.g., "User: leonidas")
  - System environment variables (e.g., `$USER`)
  - Default assumption (if single user project)

### 2. Loading
- Read `.human/users/<username>/profile.md`.
- Parse `frontmatter` for structured data.
- Read `body` for detailed context.

### 3. Execution
- Apply preferences to the current session's context.
- Maintain this context across model switches (by re-reading the profile if necessary).

## Profile Schema
```yaml
name: <username>
aliases: [<alias1>, <alias2>]
role: <role>
language:
  primary: <lang_code>
  secondary: <lang_code>
preferences:
  communication_style: <style>
```
