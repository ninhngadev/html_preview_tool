// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_ads_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bannerMustShowHash() => r'f2184a26d78077e6849788925a402be16adc6b9b';

/// See also [bannerMustShow].
@ProviderFor(bannerMustShow)
final bannerMustShowProvider = Provider<bool>.internal(
  bannerMustShow,
  name: r'bannerMustShowProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bannerMustShowHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BannerMustShowRef = ProviderRef<bool>;
String _$bannerAdsHash() => r'a389c1e0417350654518ab81623fd5a52879ce2b';

/// See also [BannerAds].
@ProviderFor(BannerAds)
final bannerAdsProvider = NotifierProvider<BannerAds, bool>.internal(
  BannerAds.new,
  name: r'bannerAdsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$bannerAdsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BannerAds = Notifier<bool>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
