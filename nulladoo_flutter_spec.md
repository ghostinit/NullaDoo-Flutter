# NullaDoo Flutter — Handoff Spec

## Purpose

Adam is rebuilding **NullaDoo** — a todo list app — in Flutter to compare the Flutter developer
experience against the React Native (Expo) version he already completed. The goal is hands-on
intuition, not just reading opinions. At the end he will decide which ecosystem he prefers.

This document is everything you need to guide him from scratch.

---

## Who Adam is

- **Background:** Python + PLC experience, solid JavaScript (completed a 9-round JS refresher
  covering closures, async, classes, array methods, modules). No prior Dart/Flutter exposure.
- **RN version complete:** He built NullaDoo in Expo Router + React Native + Tamagui. He
  understands `useState`, context, `FlatList`, styled components, file-based routing, and
  immutable state updates. **Do not re-teach those concepts from JS/RN — translate them to Flutter
  equivalents instead.** (e.g. "this is like `useState`" is fine; re-explaining closures is not.)
- **Pace:** concepts click fast once explained. He reads quickly but can skim — be explicit about
  nesting when giving code instructions.
- **Python reflexes to watch:** no keyword args in Dart, empty lists/maps are truthy.

---

## How we work — non-negotiable

- **He writes ALL the code.** Initially, show him the code and he will type it, as he gets more comfortable move towards giving him the spec rather than full code. He will tell you if he needs the full code.
- **One small step at a time.** One concept, one widget, one file at a time.
- **Predict-the-output rounds** welcome for new concepts before he types.
- **Flag his choices, even correct ones** — ask "what do you expect this to do?" so he confirms
  intent. This is how he builds mental models.
- **Short responses, no fluff.** He will tell you if he wants more explanation.
- **Always name parent/child explicitly** in layout instructions — "inside the `Column`, not the
  `Scaffold`" — ambiguous parentheticals cause nesting bugs.
- **Be explicit about where things go in the file.** He does not want to hunt.
- **No scope creep.** He wants to explore flutter capabilities. Adding 'todo specific' features (tags, subtasks, due dates) should be avoided. But show him how flutter can make beautiful UI's so please explore animations, themeing and such.
  The goal is parity with the RN version, then comparison, then move on.
- **Review his code like a patient pair-programmer** after each step: what's good, what's a
  footgun, how a Flutter dev would tweak it.

---

## What to build — the app

**NullaDoo** is a two-level todo app. No backend, no auth, no persistence (yet — in-memory only,
matching the RN version at the point we stopped).

### Data model

```
TodoList
  id: String (UUID)
  name: String
  todos: List<Todo>

Todo
  id: String (UUID)
  text: String
  done: bool
```

### Screens / navigation

| Screen       | Route analogue | Description                                                                                |
| ------------ | -------------- | ------------------------------------------------------------------------------------------ |
| Lists screen | `/` (index)    | Shows all `TodoList`s. Tap a list → go to its todos.                                       |
| Todos screen | `/list/:id`    | Shows all `Todo`s for one list.                                                            |
| Add modal    | `/newItem`     | Shared modal — no `listId` param = add a list; `listId` present = add a todo to that list. |

### Feature checklist (match RN version exactly)

- [x] View all todo lists (empty state message when none)
- [x] Add a new todo list (via modal, `+` button in header)
- [x] Delete a todo list
- [x] Navigate into a list to see its todos
- [x] Add a new todo to a list (via same modal, `+` button in header)
- [x] Toggle a todo done/not-done (strikethrough text)
- [x] Delete a todo
- [x] Shared add modal — same screen handles both list-add and todo-add based on a param

### Theming — NullRider

The RN version has a custom dark theme: deep black background, neon green text, dark green borders.
Recreate the same vibe in Flutter:

- Background: `#0A0F0A`
- Primary text / accent: `#39FF14` (neon green)
- Border/secondary: `#1FAA3F`

Use `ThemeData` with a custom `ColorScheme`. Keep it simple — no third-party theming packages.

---

## Tech stack

| Concern     | Choice             | Reason                                                                                                                                                                    |
| ----------- | ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Language    | Dart               | Required for Flutter                                                                                                                                                      |
| Navigation  | `go_router`        | Closest Flutter analogue to Expo Router (declarative, URL-based, supports params + modals). Read the current docs before writing any routes.                              |
| State       | `provider` package | Closest analogue to React Context + `useState`. Single `ChangeNotifier` that holds the list of `TodoList`s. Avoid Riverpod/Bloc — that's over-engineering for this scope. |
| IDs         | `uuid` package     | Same as `expo-crypto` UUID in the RN version.                                                                                                                             |
| Persistence | None (in-memory)   | Match the RN version. Persistence is a future exercise.                                                                                                                   |

---

## Suggested build phases (one per session or conversation turn)

Build in this order, mirroring exactly how the RN version was built:

1. **Bare project** — `flutter create nulladoo_flutter`, run on device/emulator, confirm it works.
2. **Static lists screen** — hardcoded list, no state. Teaches `Scaffold`, `AppBar`, `ListView`,
   `ListTile`, basic `ThemeData`.
3. **State: add + delete a list** — introduce `ChangeNotifier` + `provider`. Teaches
   `notifyListeners()`, `Consumer<>`, `context.read<>()`.
4. **Navigation** — add `go_router`. Tap a list → navigate to a stub todos screen.
   Pass the list ID as a path param.
5. **Todos screen** — read the list by ID from the provider, show its todos.
6. **Add/toggle/delete todos** — immutable list updates inside the `ChangeNotifier`.
7. **Shared add modal** — single route `/new` that checks for a `listId` query param and branches.
   Header `+` button on both screens.
8. **NullRider theme** — apply the dark + neon-green `ThemeData`. Style cards and buttons.
9. **Compare** — side by side notes on what felt easier/harder vs RN.

---

## Comparison axis — what to notice

As you build, prompt Adam to notice:

- **Widget tree vs JSX** — how does explicit `child:`/`children:` compare to JSX nesting?
- **Hot reload** — Flutter's is legendary. How does it feel vs Expo Go?
- **Type system** — Dart is fully sound. How does it compare to TypeScript + RN?
- **Layout model** — `Column`/`Row`/`Expanded` vs Flexbox. What's more intuitive?
- **State + navigation plumbing** — `provider` + `go_router` vs Context + Expo Router.
- **Theming** — `ThemeData`/`ColorScheme` vs Tamagui tokens.
- **Tooling** — `flutter pub add` vs `npm install`, analyzer vs ESLint.
- **Error messages** — which are friendlier?

No verdict needed mid-build. Let the experience accumulate, then do a retrospective at the end.

---

## What the RN version looks like (reference)

Key files in `/home/nullrider/ghostinit/NullaDoo/`:

- `context/TodoListsContext.tsx` — the data model + context plumbing
- `app/_layout.tsx` — root layout, state lives here, wraps everything in Provider + TamaguiProvider
- `app/index.tsx` — lists screen (FlatList + Link + delete button)
- `app/list/[id].tsx` — todos screen (FlatList + toggle Pressable + delete button); uses HOF
  `updateThisListsTodos(transform)` to avoid duplicating the outer `map`
- `app/newItem.tsx` — shared add modal (branches on `listId` param)
- `components/` — Screen, Card, Button (tone variant: default/danger), Input, CustomText
- `tamagui.config.ts` — NullRider theme (spreads dark, overrides bg/color/border)

Read these for exact behavior. The Flutter version should feel the same to a user.

---

## Rules for the agent

1. **Read the current Flutter and go_router docs** before writing any code involving navigation or
   new APIs. Do not rely on training-data knowledge of package APIs — they change.
2. Teach Dart/Flutter concepts as they surface, in terms of analogues Adam already knows from
   RN/JS. Keep teaching tight — one concept per step.
3. **Never write a complete widget for him.** Scaffold the structure in words, then have him write
   each field. Review what he writes before moving on.
4. Keep the `progress.md` equivalent in this Flutter project updated after each milestone.
5. If Adam asks to add features beyond the checklist above — tag them as "parked" and keep him
   on the current step.
6. The project directory will live at `/home/nullrider/ghostinit/nulladoo_flutter/` (sibling to
   the RN version).

## Hi from Adam

This is Adam typing this. Everything in here is guidelines. I like to have fun programming so please show up as a jovial (but firm) teacher and guide. While the goal is to compare to RN, the goal is also to have fun and explore what flutter can with even a simple todo project like this! Let's build something functional, but also beautiful :)

Thank you for your help ahead of time!
