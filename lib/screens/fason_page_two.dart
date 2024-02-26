import 'package:flutter/material.dart';
import 'package:inventory_app/components/app_constants.dart';
import 'package:inventory_app/components/horizontal_divider.dart';
import 'package:inventory_app/components/page_header.dart';

class FasonPage extends StatelessWidget {
  const FasonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
      child: Column(
        children: [
          Header(
            headerText: "Fason Kesim Listesi",
            onpress: () {},
          ),
          const HorizontalDivider(),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.75,
              child: ListView.separated(
                separatorBuilder: (context, index) => const HorizontalDivider(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 3, bottom: 5, right: 3),
                    child: Center(
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "data",
                                style: AppConsts.getInstance().syneMono(),
                              ),
                              IconButton(
                                style: IconButton.styleFrom(
                                    foregroundColor: Colors.greenAccent),
                                icon: const Icon(Icons.info_outline),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
