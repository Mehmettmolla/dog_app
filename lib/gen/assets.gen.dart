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

  /// File path: assets/icons/ic_close.svg
  String get icClose => 'assets/icons/ic_close.svg';

  /// File path: assets/icons/ic_home.svg
  String get icHome => 'assets/icons/ic_home.svg';

  /// File path: assets/icons/ic_settings.svg
  String get icSettings => 'assets/icons/ic_settings.svg';

  /// File path: assets/icons/ic_settings_arrow.svg
  String get icSettingsArrow => 'assets/icons/ic_settings_arrow.svg';

  /// File path: assets/icons/ic_settings_help.svg
  String get icSettingsHelp => 'assets/icons/ic_settings_help.svg';

  /// File path: assets/icons/ic_settings_privacy.svg
  String get icSettingsPrivacy => 'assets/icons/ic_settings_privacy.svg';

  /// File path: assets/icons/ic_settings_rate.svg
  String get icSettingsRate => 'assets/icons/ic_settings_rate.svg';

  /// File path: assets/icons/ic_settings_share.svg
  String get icSettingsShare => 'assets/icons/ic_settings_share.svg';

  /// File path: assets/icons/ic_settings_term.svg
  String get icSettingsTerm => 'assets/icons/ic_settings_term.svg';

  /// File path: assets/icons/ic_settings_version.svg
  String get icSettingsVersion => 'assets/icons/ic_settings_version.svg';

  /// List of all assets
  List<String> get values => [
        icClose,
        icHome,
        icSettings,
        icSettingsArrow,
        icSettingsHelp,
        icSettingsPrivacy,
        icSettingsRate,
        icSettingsShare,
        icSettingsTerm,
        icSettingsVersion
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/im_bottom_bar.png
  AssetGenImage get imBottomBar =>
      const AssetGenImage('assets/images/im_bottom_bar.png');

  /// File path: assets/images/im_splash.png
  AssetGenImage get imSplash =>
      const AssetGenImage('assets/images/im_splash.png');

  /// List of all assets
  List<AssetGenImage> get values => [imBottomBar, imSplash];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
