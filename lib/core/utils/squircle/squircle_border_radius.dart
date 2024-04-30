// ignore_for_file: overridden_fields, unused_element

import 'package:flutter/rendering.dart';

import 'package:untravelled_app/core/utils/squircle/path_squircle_corners.dart';
import 'package:untravelled_app/core/utils/squircle/processed_squircle_radius.dart';
import 'package:untravelled_app/core/utils/squircle/squircle_radius.dart';

class UntravelledSquircleBorderRadius extends BorderRadius {
  /// A border radius with all zero radii.
  static const UntravelledSquircleBorderRadius zero = UntravelledSquircleBorderRadius.all(UntravelledSquircleRadius.zero);

  /// The top-left [UntravelledSquircleRadius].
  @override
  final UntravelledSquircleRadius topLeft;

  /// The top-right [UntravelledSquircleRadius].
  @override
  final UntravelledSquircleRadius topRight;

  /// The bottom-left [UntravelledSquircleRadius].
  @override
  final UntravelledSquircleRadius bottomLeft;

  /// The bottom-right [UntravelledSquircleRadius].
  @override
  final UntravelledSquircleRadius bottomRight;

  UntravelledSquircleBorderRadius({
    required double cornerRadius,
    // The value of 1 or 1.0 leads to NaN error in mobile web/PWA for some reason. So we use 0.99 instead.
    double cornerSmoothing = 0.99,
  }) : this.only(
          topLeft: UntravelledSquircleRadius(
            cornerRadius: cornerRadius,
            cornerSmoothing: cornerSmoothing,
          ),
          topRight: UntravelledSquircleRadius(
            cornerRadius: cornerRadius,
            cornerSmoothing: cornerSmoothing,
          ),
          bottomLeft: UntravelledSquircleRadius(
            cornerRadius: cornerRadius,
            cornerSmoothing: cornerSmoothing,
          ),
          bottomRight: UntravelledSquircleRadius(
            cornerRadius: cornerRadius,
            cornerSmoothing: cornerSmoothing,
          ),
        );

  /// Creates a border radius where all radii are [radius].
  const UntravelledSquircleBorderRadius.all(UntravelledSquircleRadius radius)
      : this.only(
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        );

  /// Creates a vertically symmetric border radius where the top and bottom
  /// sides of the rectangle have the same radii.
  const UntravelledSquircleBorderRadius.vertical({
    UntravelledSquircleRadius top = UntravelledSquircleRadius.zero,
    UntravelledSquircleRadius bottom = UntravelledSquircleRadius.zero,
  }) : this.only(
          topLeft: top,
          topRight: top,
          bottomLeft: bottom,
          bottomRight: bottom,
        );

  /// Creates a horizontally symmetrical border radius where the left and right
  /// sides of the rectangle have the same radii.
  const UntravelledSquircleBorderRadius.horizontal({
    UntravelledSquircleRadius left = UntravelledSquircleRadius.zero,
    UntravelledSquircleRadius right = UntravelledSquircleRadius.zero,
  }) : this.only(
          topLeft: left,
          topRight: right,
          bottomLeft: left,
          bottomRight: right,
        );

  /// Creates a border radius with only the given non-zero values. The other
  /// corners will be right angles.
  const UntravelledSquircleBorderRadius.only({
    this.topLeft = UntravelledSquircleRadius.zero,
    this.topRight = UntravelledSquircleRadius.zero,
    this.bottomLeft = UntravelledSquircleRadius.zero,
    this.bottomRight = UntravelledSquircleRadius.zero,
  }) : super.only(
          topLeft: topLeft,
          bottomRight: topRight,
          topRight: topRight,
          bottomLeft: bottomLeft,
        );

  /// Needed by internals of Flutter framework.
  Radius get _topLeft => topLeft;
  Radius get _topRight => topRight;
  Radius get _bottomLeft => bottomLeft;
  Radius get _bottomRight => bottomRight;
  Radius get _topStart => Radius.zero;
  Radius get _topEnd => Radius.zero;
  Radius get _bottomStart => Radius.zero;
  Radius get _bottomEnd => Radius.zero;

  /// Returns a copy of this BorderRadius with the given fields replaced with
  /// the new values.
  @override
  UntravelledSquircleBorderRadius copyWith({
    Radius? topLeft,
    Radius? topRight,
    Radius? bottomLeft,
    Radius? bottomRight,
  }) {
    return UntravelledSquircleBorderRadius.only(
      topLeft: topLeft is UntravelledSquircleRadius ? topLeft : this.topLeft,
      topRight: topRight is UntravelledSquircleRadius ? topRight : this.topRight,
      bottomLeft: bottomLeft is UntravelledSquircleRadius ? bottomLeft : this.bottomLeft,
      bottomRight: bottomRight is UntravelledSquircleRadius ? bottomRight : this.bottomRight,
    );
  }

  /// Creates a [Path] inside the given [Rect].
  Path toPath(Rect rect) {
    final width = rect.width;
    final height = rect.height;

    final result = Path();

    /// Calculating only if values are different
    final processedTopLeft = ProcessedSquircleRadius(
      topLeft,
      width: width,
      height: height,
    );

    final processedBottomLeft = topLeft == bottomLeft
        ? processedTopLeft
        : ProcessedSquircleRadius(
            bottomLeft,
            width: width,
            height: height,
          );

    final processedBottomRight = bottomLeft == bottomRight
        ? processedBottomLeft
        : ProcessedSquircleRadius(
            bottomRight,
            width: width,
            height: height,
          );

    final processedTopRight = topRight == bottomRight
        ? processedBottomRight
        : ProcessedSquircleRadius(
            topRight,
            width: width,
            height: height,
          );

    result
      ..addSmoothTopRight(processedTopRight, rect)
      ..addSmoothBottomRight(processedBottomRight, rect)
      ..addSmoothBottomLeft(processedBottomLeft, rect)
      ..addSmoothTopLeft(processedTopLeft, rect);

    return result.transform(
      Matrix4.translationValues(rect.left, rect.top, 0).storage,
    );
  }

  @override
  BorderRadiusGeometry subtract(BorderRadiusGeometry other) {
    if (other is UntravelledSquircleBorderRadius) return this - other;
    return super.subtract(other);
  }

  @override
  BorderRadiusGeometry add(BorderRadiusGeometry other) {
    if (other is UntravelledSquircleBorderRadius) return this + other;
    return super.add(other);
  }

  /// Returns the difference between two [BorderRadius] objects.
  @override
  UntravelledSquircleBorderRadius operator -(BorderRadius other) {
    if (other is UntravelledSquircleBorderRadius) {
      return UntravelledSquircleBorderRadius.only(
        topLeft: (topLeft - other.topLeft) as UntravelledSquircleRadius,
        topRight: (topRight - other.topRight) as UntravelledSquircleRadius,
        bottomLeft: (bottomLeft - other.bottomLeft) as UntravelledSquircleRadius,
        bottomRight: (bottomRight - other.bottomRight) as UntravelledSquircleRadius,
      );
    }

    return this;
  }

  /// Returns the sum of two [BorderRadius] objects.
  @override
  UntravelledSquircleBorderRadius operator +(BorderRadius other) {
    if (other is UntravelledSquircleBorderRadius) {
      return UntravelledSquircleBorderRadius.only(
        topLeft: (topLeft + other.topLeft) as UntravelledSquircleRadius,
        topRight: (topRight + other.topRight) as UntravelledSquircleRadius,
        bottomLeft: (bottomLeft + other.bottomLeft) as UntravelledSquircleRadius,
        bottomRight: (bottomRight + other.bottomRight) as UntravelledSquircleRadius,
      );
    }

    return this;
  }

  /// Returns the [BorderRadius] object with each corner negated.
  ///
  /// This is the same as multiplying the object by -1.0.
  @override
  UntravelledSquircleBorderRadius operator -() {
    return UntravelledSquircleBorderRadius.only(
      topLeft: (-topLeft) as UntravelledSquircleRadius,
      topRight: (-topRight) as UntravelledSquircleRadius,
      bottomLeft: (-bottomLeft) as UntravelledSquircleRadius,
      bottomRight: (-bottomRight) as UntravelledSquircleRadius,
    );
  }

  /// Scales each corner of the [BorderRadius] by the given factor.
  @override
  UntravelledSquircleBorderRadius operator *(double other) {
    return UntravelledSquircleBorderRadius.only(
      topLeft: topLeft * other,
      topRight: topRight * other,
      bottomLeft: bottomLeft * other,
      bottomRight: bottomRight * other,
    );
  }

  /// Divides each corner of the [BorderRadius] by the given factor.
  @override
  UntravelledSquircleBorderRadius operator /(double other) {
    return UntravelledSquircleBorderRadius.only(
      topLeft: topLeft / other,
      topRight: topRight / other,
      bottomLeft: bottomLeft / other,
      bottomRight: bottomRight / other,
    );
  }

  /// Integer divides each corner of the [BorderRadius] by the given factor.
  @override
  UntravelledSquircleBorderRadius operator ~/(double other) {
    return UntravelledSquircleBorderRadius.only(
      topLeft: topLeft ~/ other,
      topRight: topRight ~/ other,
      bottomLeft: bottomLeft ~/ other,
      bottomRight: bottomRight ~/ other,
    );
  }

  /// Computes the remainder of each corner by the given factor.
  @override
  UntravelledSquircleBorderRadius operator %(double other) {
    return UntravelledSquircleBorderRadius.only(
      topLeft: topLeft % other,
      topRight: topRight % other,
      bottomLeft: bottomLeft % other,
      bottomRight: bottomRight % other,
    );
  }

  /// Linearly interpolate between two [BorderRadius] objects.
  ///
  /// If either is null, this function interpolates from [BorderRadius.zero].
  ///
  /// {@macro dart.ui.shadow.lerp}
  static UntravelledSquircleBorderRadius? lerp(UntravelledSquircleBorderRadius? a, UntravelledSquircleBorderRadius? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b! * t;
    if (b == null) return a * (1.0 - t);
    return UntravelledSquircleBorderRadius.only(
      topLeft: UntravelledSquircleRadius.lerp(a.topLeft, b.topLeft, t)!,
      topRight: UntravelledSquircleRadius.lerp(a.topRight, b.topRight, t)!,
      bottomLeft: UntravelledSquircleRadius.lerp(a.bottomLeft, b.bottomLeft, t)!,
      bottomRight: UntravelledSquircleRadius.lerp(a.bottomRight, b.bottomRight, t)!,
    );
  }

  @override
  BorderRadius resolve(TextDirection? direction) => BorderRadius.only(
        topLeft: topLeft,
        topRight: topRight,
        bottomLeft: bottomLeft,
        bottomRight: bottomRight,
      );

  @override
  String toString() {
    if (topLeft == topRight && topLeft == bottomRight && topLeft == bottomLeft) {
      final radius = topLeft.toString();
      return 'UntravelledSquircleBorderRadius${radius.substring(12)}';
    }

    return 'UntravelledSquircleBorderRadius('
        'topLeft: $topLeft, '
        'topRight: $topRight, '
        'bottomLeft: $bottomLeft, '
        'bottomRight: $bottomRight, '
        ')';
  }
}
