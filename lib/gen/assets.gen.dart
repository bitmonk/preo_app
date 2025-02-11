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

  /// File path: assets/icons/back_arrow.svg
  String get backArrow => 'assets/icons/back_arrow.svg';

  /// File path: assets/icons/calendar.svg
  String get calendar => 'assets/icons/calendar.svg';

  /// File path: assets/icons/confetti.png
  AssetGenImage get confetti =>
      const AssetGenImage('assets/icons/confetti.png');

  /// File path: assets/icons/eye.svg
  String get eye => 'assets/icons/eye.svg';

  /// File path: assets/icons/eye_slash.svg
  String get eyeSlash => 'assets/icons/eye_slash.svg';

  /// List of all assets
  List<dynamic> get values => [backArrow, calendar, confetti, eye, eyeSlash];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/explainer
  $AssetsImagesExplainerGen get explainer => const $AssetsImagesExplainerGen();

  /// Directory path: assets/images/png
  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();

  /// Directory path: assets/images/splash
  $AssetsImagesSplashGen get splash => const $AssetsImagesSplashGen();

  /// Directory path: assets/images/teams
  $AssetsImagesTeamsGen get teams => const $AssetsImagesTeamsGen();
}

class $AssetsLogosGen {
  const $AssetsLogosGen();

  /// File path: assets/logos/logoBlack.png
  AssetGenImage get logoBlack =>
      const AssetGenImage('assets/logos/logoBlack.png');

  /// File path: assets/logos/logoWhite.png
  AssetGenImage get logoWhite =>
      const AssetGenImage('assets/logos/logoWhite.png');

  /// File path: assets/logos/logoWithoutText.png
  AssetGenImage get logoWithoutText =>
      const AssetGenImage('assets/logos/logoWithoutText.png');

  /// List of all assets
  List<AssetGenImage> get values => [logoBlack, logoWhite, logoWithoutText];
}

class $AssetsImagesExplainerGen {
  const $AssetsImagesExplainerGen();

  /// File path: assets/images/explainer/explainer1.png
  AssetGenImage get explainer1 =>
      const AssetGenImage('assets/images/explainer/explainer1.png');

  /// File path: assets/images/explainer/explainer2.png
  AssetGenImage get explainer2 =>
      const AssetGenImage('assets/images/explainer/explainer2.png');

  /// File path: assets/images/explainer/explainer3.png
  AssetGenImage get explainer3 =>
      const AssetGenImage('assets/images/explainer/explainer3.png');

  /// File path: assets/images/explainer/explainer4.png
  AssetGenImage get explainer4 =>
      const AssetGenImage('assets/images/explainer/explainer4.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    explainer1,
    explainer2,
    explainer3,
    explainer4,
  ];
}

class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();

  /// File path: assets/images/png/default_picture.png
  AssetGenImage get defaultPicture =>
      const AssetGenImage('assets/images/png/default_picture.png');

  /// File path: assets/images/png/profile.png
  AssetGenImage get profile =>
      const AssetGenImage('assets/images/png/profile.png');

  /// List of all assets
  List<AssetGenImage> get values => [defaultPicture, profile];
}

class $AssetsImagesSplashGen {
  const $AssetsImagesSplashGen();

  /// File path: assets/images/splash/background.png
  AssetGenImage get background =>
      const AssetGenImage('assets/images/splash/background.png');

  /// List of all assets
  List<AssetGenImage> get values => [background];
}

class $AssetsImagesTeamsGen {
  const $AssetsImagesTeamsGen();

  /// File path: assets/images/teams/eye-slash.png
  AssetGenImage get eyeSlash =>
      const AssetGenImage('assets/images/teams/eye-slash.png');

  /// File path: assets/images/teams/melbourne.png
  AssetGenImage get melbourne =>
      const AssetGenImage('assets/images/teams/melbourne.png');

  /// File path: assets/images/teams/vikings.png
  AssetGenImage get vikings =>
      const AssetGenImage('assets/images/teams/vikings.png');

  /// File path: assets/images/teams/western.png
  AssetGenImage get western =>
      const AssetGenImage('assets/images/teams/western.png');

  /// List of all assets
  List<AssetGenImage> get values => [eyeSlash, melbourne, vikings, western];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLogosGen logos = $AssetsLogosGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

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
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
