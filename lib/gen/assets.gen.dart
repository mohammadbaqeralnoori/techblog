/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/PencilOnBook.png
  AssetGenImage get pencilOnBook =>
      const AssetGenImage('assets/icons/PencilOnBook.png');

  /// File path: assets/icons/PodCastVoice.png
  AssetGenImage get podCastVoice =>
      const AssetGenImage('assets/icons/PodCastVoice.png');

  /// File path: assets/icons/ProfileIcon.png
  AssetGenImage get profileIcon =>
      const AssetGenImage('assets/icons/ProfileIcon.png');

  /// File path: assets/icons/bluePen.png
  AssetGenImage get bluePen => const AssetGenImage('assets/icons/bluePen.png');

  /// File path: assets/icons/hashTag.png
  AssetGenImage get hashTag => const AssetGenImage('assets/icons/hashTag.png');

  /// File path: assets/icons/homeNavIcon.png
  AssetGenImage get homeNavIcon =>
      const AssetGenImage('assets/icons/homeNavIcon.png');

  /// File path: assets/icons/profileNavIcon.png
  AssetGenImage get profileNavIcon =>
      const AssetGenImage('assets/icons/profileNavIcon.png');

  /// File path: assets/icons/techBot.png
  AssetGenImage get techBotPng =>
      const AssetGenImage('assets/icons/techBot.png');

  /// File path: assets/icons/techBot.svg
  String get techBotSvg => 'assets/icons/techBot.svg';

  /// File path: assets/icons/tehRaido.png
  AssetGenImage get tehRaido =>
      const AssetGenImage('assets/icons/tehRaido.png');

  /// File path: assets/icons/voice.png
  AssetGenImage get voice => const AssetGenImage('assets/icons/voice.png');

  /// File path: assets/icons/writeNavIcon.png
  AssetGenImage get writeNavIcon =>
      const AssetGenImage('assets/icons/writeNavIcon.png');

  /// List of all assets
  List<dynamic> get values => [
        pencilOnBook,
        podCastVoice,
        profileIcon,
        bluePen,
        hashTag,
        homeNavIcon,
        profileNavIcon,
        techBotPng,
        techBotSvg,
        tehRaido,
        voice,
        writeNavIcon
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Poster1.png
  AssetGenImage get poster1 => const AssetGenImage('assets/images/Poster1.png');

  /// File path: assets/images/Poster2.png
  AssetGenImage get poster2 => const AssetGenImage('assets/images/Poster2.png');

  /// File path: assets/images/Poster3.png
  AssetGenImage get poster3 => const AssetGenImage('assets/images/Poster3.png');

  /// File path: assets/images/Poster4.png
  AssetGenImage get poster4 => const AssetGenImage('assets/images/Poster4.png');

  /// File path: assets/images/programming.png
  AssetGenImage get programming =>
      const AssetGenImage('assets/images/programming.png');

  /// File path: assets/images/tecSplash.png
  AssetGenImage get tecSplash =>
      const AssetGenImage('assets/images/tecSplash.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [poster1, poster2, poster3, poster4, programming, tecSplash];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
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
    bool gaplessPlayback = false,
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
