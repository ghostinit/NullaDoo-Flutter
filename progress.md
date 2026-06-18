# NullaDoo Flutter — Progress Log

## Phase 1: Bare Project
- [x] Install Flutter SDK
- [x] Verify install (`flutter doctor`)
- [x] `flutter create nulladoo_flutter`
- [x] Run on device/emulator — confirm default counter app works
- [x] First hot reload experience

## Phase 2: Static Lists Screen
- [x] Scaffold + AppBar + ListView + ListTile
- [x] Basic ThemeData (dark background)

## Phase 3: State — Add + Delete a List
- [x] provider + uuid packages installed (`flutter pub add provider uuid`)
- [x] Data models created — `lib/models.dart` (Todo, TodoList, all fields final/immutable)
- [x] ChangeNotifier store — `lib/store.dart` (TodoStore extends ChangeNotifier)
- [x] provider wired up in main.dart (ChangeNotifierProvider wrapping the app)
- [x] ListsScreen reads from provider instead of hardcoded widgets (context.watch in a Builder)
- [x] Add list via in-memory state (AppBar + button → AlertDialog with TextField)
- [x] Delete list (swipe-to-delete via Dismissible)

## Phase 4: Navigation
- [x] go_router added (17.3.0; MaterialApp.router + routerConfig)
- [x] Tap list → navigate to stub todos screen (context.push, separate todos_screen.dart)
- [x] List ID passed as path param (/lists/:id → state.pathParameters)

## Phase 5: Todos Screen
- [x] Read list by ID from provider (store.listById → TodoList?, null-checked in screen)
- [x] Display todos (ListView + empty state "No todos yet")

## Phase 6: Add / Toggle / Delete Todos
- [x] Add todo to a list (AppBar + → dialog → store.addTodo; immutable rebuild)
- [ ] Toggle done (strikethrough) ← NEXT
- [ ] Delete todo (swipe like deleteList, or trailing icon)
- [x] Immutable updates inside ChangeNotifier (established in addTodo: spread + replace TodoList by index)

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
