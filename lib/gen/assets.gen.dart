/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Phone.png
  AssetGenImage get phone => const AssetGenImage('assets/images/Phone.png');

  /// File path: assets/images/bafmobile.png
  AssetGenImage get bafmobile =>
      const AssetGenImage('assets/images/bafmobile.png');

  /// File path: assets/images/lock.png
  AssetGenImage get lock => const AssetGenImage('assets/images/lock.png');

  /// File path: assets/images/logobaf.png
  AssetGenImage get logobaf => const AssetGenImage('assets/images/logobaf.png');

  /// File path: assets/images/mobil.jpg
  AssetGenImage get mobil => const AssetGenImage('assets/images/mobil.jpg');

  /// File path: assets/images/motor.png
  AssetGenImage get motor => const AssetGenImage('assets/images/motor.png');

  /// File path: assets/images/mp.jpg
  AssetGenImage get mp => const AssetGenImage('assets/images/mp.jpg');

  /// File path: assets/images/ojk.png
  AssetGenImage get ojk => const AssetGenImage('assets/images/ojk.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [phone, bafmobile, lock, logobaf, mobil, motor, mp, ojk];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
