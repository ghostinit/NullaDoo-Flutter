# NullaDoo Flutter — Session Memory

This file travels with the repo so context survives across rigs and fresh Claude sessions.
Paste the relevant sections into the chat at the start of a new session if needed.

---

## Who Adam is

- Python + PLC background, solid JavaScript. Completed NullaDoo in Expo Router + React Native + Tamagui.
- Knows: `useState`, context, `FlatList`, styled components, file-based routing, immutable state updates.
- No prior Dart/Flutter experience.
- **Teach by analogy to RN/JS — do not re-explain JS fundamentals.**
- Python reflexes to watch: no keyword args in Dart, empty lists/maps are truthy.

---

## Working rules (non-negotiable)

- Adam writes ALL the code. Show code early; shift to specs as he gets comfortable.
- One concept / one widget / one file per step.
- Name parent/child explicitly in layout instructions ("inside the `Column`, not the `Scaffold`").
- Be explicit about file location — don't make him hunt.
- Flag his choices (even correct ones) — "what do you expect this to do?"
- Short responses. He'll ask for more if he wants it.
- Review his code after each step: good, footgun, how a Flutter dev would tweak it.
- No scope creep: extra todo features (tags, subtasks, due dates) → park them.
- UI beauty (animations, theming) within scope → encouraged.
- Read current Flutter / go_router docs before writing navigation code.
- Update `progress.md` after each milestone.

---

## Project

- **Spec:** `nulladoo_flutter_spec.md` (project root) — read it for full detail.
- **Flutter project dir:** `nulladoo_flutter/` (sibling to this repo, at `/home/nullrider/ghostinit/nulladoo_flutter/`)
- **RN reference:** `/home/nullrider/ghostinit/NullaDoo/`

### Stack
| Concern | Choice |
|---|---|
| Language | Dart |
| Navigation | go_router |
| State | provider (ChangeNotifier) |
| IDs | uuid package |
| Persistence | None (in-memory) |

### Theme — NullRider
| Token | Value |
|---|---|
| Background | `#0A0F0A` |
| Primary / accent | `#39FF14` (neon green) |
| Border / secondary | `#1FAA3F` |

---

## Current phase

See `progress.md` for the full checklist. Update this line when phases change.

**Last completed:** (nothing yet — fresh start)
**Currently on:** Phase 1 — Flutter install + bare project

---

## Decisions & notes

- Using ThemeData + ColorScheme only — no third-party theming packages.
- go_router chosen as closest analogue to Expo Router.
- provider chosen as closest analogue to React Context + useState.
- Scope is strict parity with RN version feature checklist — no additions.
