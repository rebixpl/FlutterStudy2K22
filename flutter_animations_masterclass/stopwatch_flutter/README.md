# Gigachad Stopwatch

Simple stopwatch with animated clock face, created with **flutter_bloc** state management.

### You can:
 <ul>
    <li>Start / Stop the stopwatch</li>
    <li>Reset the stopwatch</li>
    <li>Add time to laps list</li>
 </ul>

## Screens:
![s2](https://user-images.githubusercontent.com/33410494/147411810-8c004c69-2d2b-49ed-ae86-d34c554d8965.png)


## File Tree

```
STOPWATCH_FLUTTER\LIB
│   app.dart
│   main.dart
│   ticker.dart
│
└───stopwatch
    ├───bloc
    │   ├───laps
    │   │       laps_bloc.dart
    │   │       laps_event.dart
    │   │       laps_state.dart
    │   │
    │   └───stopwatch
    │           stopwatch_bloc.dart
    │           stopwatch_event.dart
    │           stopwatch_state.dart
    │
    └───ui
        │   laps.dart
        │   stopwatch.dart
        │
        ├───stopwatch
        │       stopwatch_actions.dart
        │       stopwatch_renderer.dart
        │       stopwatch_ticker_ui.dart
        │
        └───widgets
            ├───buttons
            │       add_lap_button.dart
            │       reset_button.dart
            │       start_stop_button.dart
            │
            ├───clock
            │       clock_hand.dart
            │       clock_hand_circle.dart
            │       clock_markers.dart
            │
            └───text
                    elapsed_time_text.dart
                    elapsed_time_text_basic.dart
```
