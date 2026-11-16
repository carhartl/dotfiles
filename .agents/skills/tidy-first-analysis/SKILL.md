---
name: tidy-first-analysis
description: Command-only workflow for analyzing an intended code behavior change using Kent Beck's Tidy First principles and recommending small behavior-preserving tidyings before implementation. Use via /skill:tidy-first-analysis when comparing skill versus prompt-template approaches, or when explicitly asked to run a Tidy First analysis.
disable-model-invocation: true
---

# Tidy First Analysis

Analyze the current task through Kent Beck's _Tidy First?_ lens. Recommend only small, behavior-preserving structural changes that plausibly make the desired behavior change easier.

## Workflow

1. **Identify the behavior change**
   - State the behavior to add, change, or fix.
   - Keep behavior changes distinct from structure changes.
   - If the intended behavior is unclear, ask for clarification before inspecting broadly.

2. **Find the relevant code**
   - If the user did not name files, inspect the project to identify likely entry points, tests, modules, and call paths.
   - Read enough relevant code to understand current structure before recommending tidyings.
   - Prefer targeted inspection over broad cleanup hunting.

3. **Apply Tidy First principles**
   Evaluate the involved code for:
   - Small, reversible, behavior-preserving structure changes
   - Coupling that makes the behavior change ripple across code
   - Cohesion problems: related code split apart or unrelated code mixed together
   - Optionality: changes that make future choices easier without committing to a large redesign
   - Economics: whether a tidying is likely to pay for itself for this task

4. **Consider Beck's tidying catalog**
   Use these names when applicable:
   - Guard Clauses
   - Dead Code
   - Normalize Symmetries
   - New Interface, Old Implementation
   - Reading Order
   - Cohesion Order
   - Move Declaration and Initialization Together
   - Explaining Variables
   - Explaining Constants
   - Explicit Parameters
   - Chunk Statements
   - Extract Helper
   - One Pile
   - Explaining Comments
   - Delete Redundant Comments

5. **Prioritize recommendations**
   Produce a concise table or bullet list. For each recommendation include:
   - Target file/function/module
   - Tidying name
   - Why it helps the intended behavior change
   - Risk: low / medium / high
   - Timing: before / after / later / never

## Constraints

- Do not implement tidyings unless the user explicitly asks you to proceed.
- Do not recommend broad cleanup unrelated to the current behavior change.
- Prefer a short prioritized list over an exhaustive catalog.
- If no tidying pays for itself, say so and recommend changing behavior directly.
