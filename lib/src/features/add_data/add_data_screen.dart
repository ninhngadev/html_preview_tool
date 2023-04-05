// ignore_for_file: use_build_context_synchronously

import 'package:andesgroup_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iap_interface/iap_interface.dart';

import '../../../main.dart';
import '../../utils/utils.dart';
import 'add_data_providers.dart';

class AddDataScreen extends ConsumerStatefulWidget {
  const AddDataScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AddDataState();
}

class _AddDataState extends ConsumerState<AddDataScreen> {
  final titleCtl = TextEditingController();
  final contentCtl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add your data'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 1200,
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  ImageWidget(
                    imageUrl: ref.watch(addDataProvider.select((value) => value.image)),
                    width: 300,
                    height: 200,
                    radius: 16,
                  ),
                  const Gap(16),
                  ElevatedButton(
                      onPressed: () async {
                        ref.read(addDataProvider.notifier).pickImage();
                      },
                      child: const Text('Pick an image')),
                  const Gap(16),
                  TextFormField(
                    controller: titleCtl,
                    autofocus: true,
                    validator: validateEmpty,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                    ),
                  ),
                  const Gap(16),
                  TextFormField(
                    controller: contentCtl,
                    autofocus: true,
                    validator: validateEmpty,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Content',
                    ),
                  ),
                  const Gap(16),
                  if (showTypeDiamond)
                    Column(
                      children: const [
                        Text(
                          'Costs $coinsSpend diamonds each time adding data or no diamonds if subscribe premium.',
                          textAlign: TextAlign.center,
                        ),
                        Gap(16),
                      ],
                    ),
                  ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState?.validate() == true) {
                          final added = await ref.read(addDataProvider.notifier).add(titleCtl.text, contentCtl.text);
                          if (added) {
                            showSnackBar(
                              context,
                              'Add success!',
                              backgroundColor: Theme.of(context).primaryColor,
                            );
                          } else {
                            showAlertDialog(context,
                                title: 'Out of diamonds',
                                content: 'Please buy more diamonds or upgrade to continue using.',
                                titleOk: 'Upgrade & buy', onOk: () {
                              push(context, ref.read(iapProvider.notifier).buyScreen());
                            });
                          }
                        }
                      },
                      child: const Text('Add')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
