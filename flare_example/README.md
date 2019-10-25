# flare_example

Flare examples

Links:
 - smiley-switch animation: https://www.2dimensions.com/a/pollux/files/flare/smiley-switch
 - ham2close animation: https://www.2dimensions.com/a/bendezuvlad/files/flare/ham2close


Simple flare animation:
```dart
bool isOpen = false;
Container(
  width: 100,
  height: 100,
  child: GestureDetector(
    onTap: () => setState(() {
      isOpen = !isOpen;
    }),
    child: FlareActor(
      "assets/Ham2Close.flr",
      color: Theme.of(context).primaryColor,
      animation: isOpen ? "To Close" : "To Ham",
    ),
  ),
),
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
