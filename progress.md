# NullaDoo Flutter — Progress Log

## Phase 1: Bare Project
- [ ] Install Flutter SDK
- [ ] Verify install (`flutter doctor`)
- [ ] `flutter create nulladoo_flutter`
- [ ] Run on device/emulator — confirm default counter app works
- [ ] First hot reload experience

## Phase 2: Static Lists Screen
- [ ] Scaffold + AppBar + ListView + ListTile
- [ ] Basic ThemeData (dark background)

## Phase 3: State — Add + Delete a List
- [ ] ChangeNotifier model
- [ ] provider package wired up
- [ ] Add list via in-memory state
- [ ] Delete list

## Phase 4: Navigation
- [ ] go_router added
- [ ] Tap list → navigate to stub todos screen
- [ ] List ID passed as path param

## Phase 5: Todos Screen
- [ ] Read list by ID from provider
- [ ] Display todos (empty state)

## Phase 6: Add / Toggle / Delete Todos
- [ ] Add todo to a list
- [ ] Toggle done (strikethrough)
- [ ] Delete todo
- [ ] Immutable updates inside ChangeNotifier

## Phase 7: Shared Add Modal
- [ ] `/new` route with optional `listId` query param
- [ ] Branches: no param = add list, param present = add todo
- [ ] `+` button in AppBar on both screens

## Phase 8: NullRider Theme
- [ ] Full dark ThemeData + ColorScheme
- [ ] Neon green accent (`#39FF14`)
- [ ] Styled cards, buttons, borders
- [ ] Animations / UI polish explorations

## Phase 9: Retrospective
- [ ] Side-by-side notes vs RN version
- [ ] Verdict on Flutter DX
