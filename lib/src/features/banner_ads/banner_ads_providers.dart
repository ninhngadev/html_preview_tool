import 'package:iap_interface/iap_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'banner_ads_providers.g.dart';

@Riverpod(keepAlive: true)
class BannerAds extends _$BannerAds {
  @override
  bool build() {
    return true;
  }

  void show() {
    state = true;
  }

  void hide() {
    state = false;
  }
}

@Riverpod(keepAlive: true)
bool bannerMustShow(BannerMustShowRef ref) {
  final bannerShowed = ref.watch(bannerAdsProvider);
  final loadProductDone = ref.watch(iapProvider.select((value) => value.loadProductDone));
  final haveRemoveAds = ref.watch(iapProvider.select((value) => value.havePremium));
  if (loadProductDone && bannerShowed && !haveRemoveAds) {
    return true;
  }
  return false;
}
