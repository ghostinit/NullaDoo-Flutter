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

**Last completed:** Phase 4 (go_router nav) + Phase 5 (todos screen reads list by id, renders todos + empty state) + most of Phase 6 (addTodo done with immutable rebuild pattern).
**Currently on:** Phase 6 — Toggle / Delete todos.
**Next step:** Add `toggleTodo(listId, todoId)` to the store (immutable: rebuild the Todo with done flipped, rebuild its TodoList, swap by index) and apply strikethrough in the TodosScreen ListTile. Then `deleteTodo`.

**Env reminder:** Now on a MacBook (Apple Silicon), Flutter 3.44.2, running on the **iOS Simulator** (`open -a Simulator`, then `flutter run`). go_router 17.3.0. NOT the old Linux/Android rig.

---

## Decisions & notes

- Using ThemeData + ColorScheme only — no third-party theming packages.
- go_router chosen as closest analogue to Expo Router.
- provider chosen as closest analogue to React Context + useState.
- Scope is strict parity with RN version feature checklist — no additions.
