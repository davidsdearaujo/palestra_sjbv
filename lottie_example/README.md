# lottie_example

Lottie example

Urls:
 - https://lottiefiles.com/10475-drawing-a-love
 - https://lottiefiles.com/10499-thumb-up
 - https://lottiefiles.com/257-favorie

```dart
GestureDetector(
  onTap: () {
    isLiked = !isLiked;
    if (isLiked) {
      controller.start();
    } else {
      controller.stopAndReset(rewind: true);
    }
  },
  child: FluttieAnimation(
    controller,
    size: widget.size,
  ),
)
```



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
