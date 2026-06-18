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
- [x] Toggle done (Checkbox + TextDecoration.lineThrough)
- [x] Delete todo (swipe-to-delete via Dismissible)
- [x] Immutable updates inside ChangeNotifier (established in addTodo: spread + replace TodoList by index)
- [x] copyWith added to Todo model

## Phase 7: Shared Add Modal
- [x] Shared `showAddModal` top-level function in `add_modal.dart`
- [x] Branches: no listId = add list, listId present = add todo
- [x] `+` button in AppBar on both screens calls shared modal

## Phase 8: NullRider Theme
- [x] Full dark ThemeData + ColorScheme (surface, primary, secondary, onSurface)
- [x] AppBarTheme — dark bg, neon green foreground
- [x] CheckboxTheme — neon green fill, dark tick
- [x] TextButtonTheme — neon green dialog buttons
- [x] DialogTheme — dark bg, neon green title
- [x] InputDecorationTheme — neon green focused underline

## Phase 9: Retrospective

### Language — Dart vs JS/TypeScript
Dart felt more at home. The concepts translated — even when the syntax was unfamiliar, the next step was always clear. RN/JS felt patched together by comparison: another file here, another dependency, wrap this thing, config that file, and the dep versions still might not align.

### State — ChangeNotifier vs useState + Context
`ChangeNotifier` was intuitive from the start. React's `useState` + `ContextProvider` felt forced — like the right primitives assembled into the wrong shape for mobile state.

### Navigation — go_router vs Expo Router
go_router felt simple enough to build yourself. Expo Router is roughly equivalent but leans harder on convention/magic. Slight edge to go_router for transparency.

### Styling & Theming — ThemeData vs Tamagui
Flutter wins decisively. The whole reason this project started: tried to animate an accordion in RN, couldn't get it working without installing more packages and more config. Fancy animations "aren't worth the time" in RN. In Flutter they're table stakes.

### Dev Experience
Flutter on iOS sim was a pleasure. Hot reload fast, error messages useful, tooling felt first-class and purpose-built.

### Verdict
Flutter. It feels designed for mobile from the ground up — polished, robust, coherent. RN feels like the web duct-taped to a phone. Would pick Flutter for any new mobile project without hesitation.

## Bonus: Animations
- [x] `AnimatedDefaultTextStyle` — strikethrough animates in smoothly on todo done
- [x] `AnimatedOpacity` — text fades to 40% opacity when done
- Implicit animations: no controllers, no setState — just describe the end state
