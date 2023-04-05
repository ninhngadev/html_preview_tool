import 'package:andesgroup_common/common.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iap_interface/iap_interface.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../generated/assets.dart';
import '../../../main.dart';
import 'banner_ads_providers.dart';

class BannerAdsScreen extends ConsumerStatefulWidget {
  const BannerAdsScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _BannerAdsState();
}

class _BannerAdsState extends ConsumerState<BannerAdsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.refresh(iapProvider.notifier).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final mustShowBanner = ref.watch(bannerMustShowProvider);
    final haveProduct = ref.watch(iapProvider.select((value) => value.haveProduct));
    if (!mustShowBanner) {
      return const SizedBox.shrink();
    }
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CarouselSlider(
                  items: [
                    InkWell(
                      child: const ImageWidget(imageUrl: Assets.imagesBanner),
                      onTap: () async {
                        final Uri url = Uri.parse(bannerUrl);
                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                    ),
                  ],
                  options: CarouselOptions(
                    height: 60,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: 5.seconds,
                    autoPlayAnimationDuration: 2.seconds,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              const Gap(48),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 4,
          child: CloseButton(
            onPressed: () {
              ref.read(bannerAdsProvider.notifier).hide();
              if (haveProduct) {
                showAlertDialog(context,
                    title: 'Remove ads?',
                    content: 'Do you want to pay to remove ads for the next use of the app?',
                    titleOk: 'Go to buy', onOk: () {
                  push(context, ref.read(iapProvider.notifier).buyScreen());
                });
              }
            },
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(4),
            color: Colors.black45,
            child: Center(
              child: Text(
                'AD',
                style: TextStyles.t8M.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
