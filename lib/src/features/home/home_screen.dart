// ignore_for_file: use_build_context_synchronously

import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iap_interface/iap_interface.dart';

import '../../../main.dart';
import 'home_providers.dart';

final mainPageProvider = StateNotifierProvider<MainPageNotifier, List<HtmlModel>>((ref) {
  return MainPageNotifier();
});

class MainPageNotifier extends StateNotifier<List<HtmlModel>> {
  MainPageNotifier() : super(LocalStorage.get());

  save(String html) async {
    await LocalStorage.insert(HtmlModel(html: html, id: state.length));
    get();
  }

  edit(HtmlModel htmlModel) async {
    await LocalStorage.edit(htmlModel);
    get();
  }

  detele(HtmlModel htmlModel) async {
    await LocalStorage.delete(htmlModel);
    get();
  }

  get() {
    state = LocalStorage.get();
  }
}

class EditerPage extends ConsumerStatefulWidget {
  const EditerPage({Key? key, this.data}) : super(key: key);
  final HtmlModel? data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditerPageState();
}

class _EditerPageState extends ConsumerState<EditerPage> {
  TextEditingController txtHtml = TextEditingController(text: """
  <!DOCTYPE html>
  <html>
  <body>
  </body>
  </html>
""");

  @override
  Widget build(BuildContext context) {
    if (widget.data != null) txtHtml.text = widget.data!.html;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Html Editer"),
        actions: [
          TextButton(
            onPressed: () {
              if (txtHtml.text.isNotEmpty) {
                if (widget.data == null) {
                  ref.read(mainPageProvider.notifier).save(txtHtml.text);
                  Navigator.pop(context);
                } else {
                  ref.read(mainPageProvider.notifier).edit(HtmlModel(html: txtHtml.text, id: widget.data!.id));
                  Navigator.pop(context);
                }
              }
            },
            child: const Text(
              "Save",
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: GFTextFieldSquared(
                controller: txtHtml,
                editingbordercolor: Theme.of(context).primaryColor,
                idlebordercolor: Theme.of(context).primaryColor,
                borderwidth: 1,
                maxLines: 2000,
                minLines: 1000,
                hintText: "HTML"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GFButton(
              onPressed: () {
                push(context, PreviewPage(txtHtml.text));
              },
              text: "Preview",
              fullWidthButton: true,
            ),
          )
        ]),
      ),
    );
  }
}

class PreviewPage extends ConsumerStatefulWidget {
  const PreviewPage(this.html, {Key? key}) : super(key: key);
  final String html;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PreviewPageState();
}

class _PreviewPageState extends ConsumerState<PreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preview"),
      ),
      body: SingleChildScrollView(child: HtmlWidget(widget.html)),
    );
  }
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomeState();
}

class _HomeState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(iapProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(iapProvider, (previous, next) {});
    final land = !isDesktop ? false : MediaQuery.of(context).size.width > MediaQuery.of(context).size.height;
    final diamonds = ref.watch(iapProvider.select((value) => value.diamonds));
    final datas = ref.watch(homeProvider.select((value) => value.datas));
    ref.listen(iapProvider.select((value) => value.message), (previous, next) {
      if (next != null && next.message?.isNotEmpty == true) {
        showSnackBar(context, next.message ?? '', backgroundColor: next.success ? Colors.green : null);
      }
    });
    var listHtml = ref.watch(mainPageProvider);
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: const Text("HTML preview tool"),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                push(
                    context,
                    EditerPage(
                      data: listHtml[index],
                    ));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        listHtml[index].html,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Delete"),
                                  content: const Text("Are you sure you want to delete?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Cancel")),
                                    TextButton(
                                        onPressed: () {
                                          ref.read(mainPageProvider.notifier).detele(listHtml[index]);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Delete"))
                                  ],
                                );
                              });
                        },
                        child: const Icon(
                          CupertinoIcons.delete,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: listHtml.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          push(context, const EditerPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
