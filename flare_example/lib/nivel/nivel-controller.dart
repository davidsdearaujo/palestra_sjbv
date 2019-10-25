import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:meta/meta.dart';

class NivelController extends FlareController {

  NivelController({@required this.animationName});
  
  double value = 0;
  double _current = 0;
  ActorAnimation _animation;
  final String animationName;

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    if (value != _current) {
      _current = value;
      _animation..apply(value, artboard, 1);
    }
    return true;
  }
  
  @override
  void initialize(FlutterActorArtboard artboard) {
    _animation = artboard.getAnimation("0to100");
    _animation.apply(_current, artboard, 1);
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}

 
}
