import 'package:flutter/material.dart';
import 'package:test_api_app/app/model/category_model.dart';

class CatagoreItemWidget extends StatelessWidget {
  final Categores item;
  const CatagoreItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: SizedBox(
        width: 200,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${item.aPI}"),
                Text(
                  "${item.description}",
                  overflow: TextOverflow.ellipsis,
                ),
                Text("${item.auth}"),
                Text(
                  "${item.link?.split('//')[0]}",
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "${item.link?.split('//')[1]}",
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
