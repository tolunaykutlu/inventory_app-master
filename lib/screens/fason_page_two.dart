import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_app/components/app_constants.dart';
import 'package:inventory_app/components/horizontal_divider.dart';
import 'package:inventory_app/components/page_header.dart';
import 'package:inventory_app/extensions/get_size.dart';
import 'package:inventory_app/firebase/firestore_commands.dart/firestore_functions.dart';
import 'package:inventory_app/models/fason_kesim.dart';
import 'package:inventory_app/providers/data_controllers.dart';

class FasonPage extends ConsumerStatefulWidget {
  const FasonPage({super.key});

  @override
  ConsumerState<FasonPage> createState() => _FasonPageState();
}

class _FasonPageState extends ConsumerState<FasonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //singleChileScrollView widgetini kullanarak klavye açıldığında headerı itmesini engelle
        child: Padding(
          padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
          child: Column(
            children: [
              Header(
                headerText: "Stok Listesi",
                onpress: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          content: SizedBox(
                        height: context.deviceHeight * 0.3,
                        child: const Column(
                          children: [],
                        ),
                      ));
                    },
                  );
                },
              ),
              const HorizontalDivider(),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                    height: context.deviceHeight * 0.6,
                    child: /* StreamBuilder<List<FasonWork>>(
                      stream: ref 
                          .read(firebaseProvider)
                          .getAllDocumentsStreamFromFirestore(selectedFilter),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasData) {
                          var incomingProducts =
                              ref.read(dataProvider).fasons;
                          incomingProducts = snapshot.data;

                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: incomingProducts.length,
                            itemBuilder: (context, index) {
                              return listViewItems(
                                  incomingProducts, index, context);
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text("Error: ${snapshot.error}"),
                          );
                        } else {
                          return const Center(
                            child: Text("gelşmedi"),
                          );
                        }
                      },
                    ) */
                        Text("fason page")),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.black),
                  onPressed: () {},
                  child: Text(
                    "Stok Ekle",
                    style: AppConsts.getInstance().syneMono(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
